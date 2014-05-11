require 'test/unit'
require 'bin/image_finder.rb'

class GetImages < Test::Unit::TestCase
  def setup
    @image_finder = ImageFinder.new
  end

  def grab_N_images
    count = 100
    results = @image_finder.findImages('credit cards',count)

    assert(results.size == count, 'the image finder did not the correct 
    number of images, found: ' + results.size)
  end
end
