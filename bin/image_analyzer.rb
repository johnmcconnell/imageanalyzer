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
  
  def processImages
  end
end

def main
  analyzer = ImageAnalyzer.new
  
  # begin index and end index
  start = ARGV[0].to_i
  count = ARGV[1].to_i

  analyzer.gatherImages(start,count)
  
  analyzer.processImages
end

main
