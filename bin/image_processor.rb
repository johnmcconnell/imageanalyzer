
class ImageProcessor
  @@base_dir = 'images'

  # automatically adds the base image directory
  # to the from directory and to directory
  # to be idiomatic
  def initialize(from_dir,to_dir,command)
    @from_dir = File.join(@@base_dir,from_dir)
    @to_dir = File.join(@@base_dir,to_dir)
    @command = command
  end

  # runs the image processor, the processor
  # is a simple command line argument
  # but it needs to run on each image from
  # the previous directory and manipulate 
  # the image before being placed in the
  # next directory. We pass the filename
  # of the original image and the filename
  # of the image to be processed
  def run
    imagepipeline do |from,to|
     system "#{@command} #{from} #{to}"
    end
  end

  # this creates the image pipeline
  # given the base directory, we need to find
  # each file in the from directory and convert
  # its name to match the to directory we then
  # yield the result so that a command may be used
  # on the pair
  def imagepipeline
    images = Dir.entries(@from_dir).delete_if do |file|
      (file =~ /\w+\.(jpg|jpeg)/) == nil
    end
    images.each do |file|
      yield File.join(@from_dir,file), File.join(@to_dir,file)
    end
  end
end

