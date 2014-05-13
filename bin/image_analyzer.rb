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
  
  def processImages
  end
end

def main(options)
  analyzer = ImageAnalyzer.new
  
  # begin index and end index
  start = options[:start]
  count = options[:size]

  analyzer.gatherImages(start,count)
  
  analyzer.processImages
end

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: image_analyzer.rb [these options are necessary]"
  
  opts.on("--start N", Integer, "Search at the Nth result and save in the Nth filename") do |n|
    options[:start] = n
  end

  opts.on("--size N", Integer, "Search and save N images") do |n| 
    options[:size] = n
  end
end.parse!

main(options)
