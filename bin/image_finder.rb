require 'google-search'

class ImageFinder
  def findImages(query_string)
    Google::Search:Image.new(:query => query_string).filter {|image|
      i.image_type == :jpg or i.image_type == :png
    }.map { 
      |image| image.uri
    }
  end

  def saveImages(urls)
    0
  end

end
