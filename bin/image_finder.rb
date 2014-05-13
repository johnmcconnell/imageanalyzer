require 'google-search'
require 'open-uri'

class ImageFinder
  @@base_folder = File.join("images","raw")
  
  # query google to find images and download
  # into the base directory
  def findImages(query_string, count)
    images = Array.new
    Google::Search::Image.new(:query => query_string).take(count).each do |i|
      images << i
    end
    images
  end
   
  # given a list of urls find a good filename
  # and download the image
  def saveImagesFromUrls(urls)
    urls.each_with_index do |image,idx|
      name = nameForImageFromUrl(image.uri,idx)
      saveImage(name,image.uri)
    end 
  end
  
  # take the image content, filename, and directory
  # and save the image in that directory with that
  # filename
  def saveImageToDir(content,filename,dir)
    open(File.join(dir,filename),'wb') do |file|
      file << content
    end
  end

  # download an image from the url and save
  # to your desired filename
  def saveImage(filename,url)
    # open the url download the file to memory
    content = open(url).read
    # save the file to the base folder 
    saveImageToDir(content,filename,@@base_folder)
  end

  # convert and index and url to image filename
  def nameForImageFromUrl(url,idx)
    filename = "image-" + idx.to_s + urlToExtension(url)
  end

  # find the file extension given the url
  def urlToExtension(url)
    extensions = url.split(".")
    last = "." + extensions[-1]
  end
end
