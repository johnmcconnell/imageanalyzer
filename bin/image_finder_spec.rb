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
    finder = ImageFinder.new('credit cards',0)
    
    matches = extensions.zip(urls)
    
    matches.each do |ext,url|
      expect(ext).to eq(ImageFinder.urlToExtension(url))
    end
  end

  it "converts the image url to filename with offset" do
    finder = ImageFinder.new('credit cards',4)
    matches = filenames[4..2].zip(urls)
    matches.each_with_index do |item,idx|
      expect(item[0]).to eq(finder.imageNameFromUrl(item[1],idx))
    end
  end

  it "returns a filename for an image url" do
    finder = ImageFinder.new('credit cards',0)
    matches = filenames.zip(urls)
    
    matches.each_with_index do |item,idx|
      expect(item[0]).to eq(finder.imageNameFromUrl(item[1],idx))
    end
  end

  it "returns a list of images and saves them to disk" do
    count = 10
    finder = ImageFinder.new('credit cards',0)

    results = finder.findImages(count)
    expect(results.size).to eq(count)
    
    finder.saveImagesFromUrls(results)
  end
end
