require 'optparse'
require_relative 'image_finder'
require_relative 'image_processor'


# This is the image analyzer.
# It two basic features.
# 1. Gather images from the internet
# 2. Move the images along the 
#    processing pipeline
class ImageAnalyzer
  @startFolder = File.join('images','raw')

  def gatherImages(start_idx,count)
    manager = ImageFinder.new('credit cards',start_idx)
    urls = manager.findImages(count)
    manager.saveImagesFromUrls(urls)
  end
  
  def processImages(pipeline)
    puts 'processing images'
  end
end

def main(options)
  analyzer = ImageAnalyzer.new
  
  # compare task to run, default is downlaod
  if (options[:task].casecmp('run') == 0)
    analyzer.processImages(options[:pipe])
  else
    # begin index and end index
    start = options[:start]
    count = options[:size]

    analyzer.gatherImages(start,count)
  end
end

options = {
  :pipe => [],
  :task => 'GATHER'
  }
OptionParser.new do |opts|
  opts.banner = "Usage: image_analyzer.rb [options]"
  
  opts.on("--start N", Integer, "Search at the Nth result and start indexing at the Nth filename") do |n|
    options[:start] = n
  end

  opts.on("--size N", Integer, "Search for and save the N images.") do |n| 
    options[:size] = n
  end

  opts.on("--task [DOWNLOAD|RUN]","Download images or run images through pipeline.") do |task|
    options[:task] = task
  end
  
  opts.on("--pipeline p1,p2,p3",Array,"Designate which parts of the pipeline to run.") do |pipe|
    options[:pipe] = pipe
  end
end.parse!

main(options)
