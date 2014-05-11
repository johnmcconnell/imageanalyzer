require 'test/unit'
require '../bin/image_finder'

class GetImages < Test::Unit::TestCase
  def setup
    @image_finder = ImageFinder.new
    assert(false, 'to do setup')
  end

  def grab_N_images
    results = @image_finder.findImages

    assert(results.size == 100, 'not made')
  end

  def save_N_images
    results = @image_finder.findImages
    @image_finder.saveImages(results)

    results.each do |result|
      assert(false, 'file should be in directory')
    end
  end

end
