require 'google-search'
require 'open-uri'

class ImageFinder
  @@base_folder = File.join("images","raw")
  
  # the start index allows photos to be downloaded 
  # from farther down the google images web page
  # this is useful if you need to restart 
  # downloading and want to avoid duplicates
  def initialize(query,start_idx)
    @query = query
    @start_idx = start_idx
  end

  # query google to find images filter results
  # from the start index and upto the start index
  # + length
  def findImages(count)
   return ImageFinder.queryImages(@query,@start_idx,count)
  end

  # query google to find images, filter results
  # from the start index to start + length
  def self.queryImages(query,start,length)
    search = Google::Search::Image.new(:query => query,
    	:file_type => :jpg)
    search.all_items[start..(start + length - 1)]
  end
   
  # given a list of urls find a good filename
  # and download the image, and save the image
  # into the filename given by the method
  def saveImagesFromUrls(urls)
    urls.each_with_index do |image,idx|
      name = imageNameFromUrl(image.uri, idx)
      puts "saving... " + name
      ImageFinder.saveImage(name,image.uri)
    end 
  end
  
  # take the image content, filename, and directory
  # and save the image in that directory with that
  # filename
  def self.saveImageToDir(content,filename,dir)
    open(File.join(dir,filename),'wb') do |file|
      file << content
    end
  end

  # download an image from the url and save
  # to your desired filename
  def self.saveImage(filename,url)
    begin
      # open the url download the file to memory
      content = open(url).read
      # save the file to the base folder 
      ImageFinder.saveImageToDir(content,filename,@@base_folder)
    rescue Exception => e
      puts e.message
    end
  end
  
  # create a unique filename by taking the
  # start index and adding the regular idx
  # to avoid duplication
  def imageNameFromUrl(url,idx)
    ImageFinder.nameForImageFromUrl(url,@start_idx,idx)
  end

  # convert start_index, index, and url to image filename
  def self.nameForImageFromUrl(url,start_idx,idx)
    filename = "image-" + (start_idx + idx).to_s + urlToExtension(url)
  end

  # find the file extension given the url
  def self.urlToExtension(url)
    File.extname(URI.parse(url).path)
  end
end
