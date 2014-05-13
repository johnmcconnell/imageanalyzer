require_relative 'image_finder'

describe ImageFinder, "grab 10 urls" do
  let(:urls) { [ 
    	"http://www.sopimc.com/images/popular-credit-cards.jpg",
	"http://www.sopimc.com/images/popular-credit-cards.jpg",
	"http://www.sopimc.com/images/popular-credit-cards.jpg",
	"http://www.sopimc.com/images/popular-credit-cards.jpg",
	"http://www.sopimc.com/images/popular-credit-cards.jpg",
	"http://www.sopimc.com/images/popular-credit-cards.jpg",
	"http://www.sopimc.com/images/popular-credit-cards.jpg",
	"http://www.sopimc.com/images/popular-credit-cards.png",
	"http://www.sopimc.com/images/popular-credit-cards.jpg",
	"http://www.sopimc.com/images/popular-credit-cards.jpg",
	] }
  let(:extensions) { [
  	".jpg",".jpg",".jpg",".jpg",".jpg",
  	".jpg",".jpg",".png",".jpg",".jpg"
	] }
  let(:filenames) { [
    	"image-0.jpg","image-1.jpg","image-2.jpg","image-3.jpg","image-4.jpg",
    	"image-5.jpg","image-6.jpg","image-7.png","image-8.jpg","image-9.jpg",
	] }
  
  it "converts the image url to file extension" do
    finder = ImageFinder.new
    
    matches = extensions.zip(urls)
    
    matches.each do |ext,url|
      expect(ext).to eq(finder.urlToExtension(url))
    end
  end

  it "returns a filename for an image url" do
    finder = ImageFinder.new
    matches = filenames.zip(urls)
    
    matches.each_with_index do |item,idx|
      expect(item[0]).to eq(finder.nameForImageFromUrl(item[1],idx))
    end
  end

  it "returns a list of images and saves them to disk" do
    count = 10
    finder = ImageFinder.new

    results = finder.findImages('credit cards',count)
    expect(results.size).to eq(count)
    
    finder.saveImagesFromUrls(results)
  end
end
