require_relative 'image_finder'
require_relative 'image_processor'


class ImageAnalyzer
  @startFolder = File.join('images','raw')
  @manager = ImageFinder.new

  def gatherImages(start_idx,stop_idx)
    urls = @manager.findImages("credit cards",start_idx - stop_idx)
    @manager.saveImagesFromUrls(urls)
  end
  
  def processImages
    tesseract_proc = lambda { puts 'helloworld!' }
    p = ImageProcessor.new('tesseract',tesseract_proc)
    p.process
  end
end

def main
  analyzer = ImageAnalyzer.new
  analyzer.processImages
end

main
