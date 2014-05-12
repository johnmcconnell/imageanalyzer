require 'image_finder'

describe ImageFinder, "grab 10 urls" do
  it "returns a list of urls" do
    count = 10
    results = @image_finder.findImages('credit cards',count)
    results.size.should eq(count)
  end
end
