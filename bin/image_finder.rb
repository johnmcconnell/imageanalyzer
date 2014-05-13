require 'google-search'
require 'open-uri'

class ImageFinder
  @@base_folder = File.join("images","raw")
  
  def findImages(query_string, count)
    images = Array.new
    Google::Search::Image.new(:query => query_string).each do |i|
      if (images.size < count)
	images << i
      end
    end
    images
  end

  def saveImages(urls)
    urls.each_with_index do |image,idx|
      basename = filenameForUrl(image.uri,idx)
      filename = File.join(@@base_folder,basename)
      downloadImageToFile(filename,image.uri)
    end 
  end

  def downloadImageToFile(filename,url)
      open(filename,"wb") do |file|
        file << open(url).read
      end
  end

  def filenameForUrl(url,idx)
    filename = "image-" + idx.to_s + urlToExtension(url)
  end

  def urlToExtension(url)
    extensions = url.split(".")
    last = "." + extensions[-1]
  end
end
