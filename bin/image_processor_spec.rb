require_relative 'image_processor'

describe ImageProcessor, "to from check" do
   it "takes a given directory and 
      yields new filenames" do
      f_base = 'raw'
      t_base = 'non-sense'
      p = ImageProcessor.new(f_base,t_base,'echo',10)

      p.imagepipeline do |from,to|
        f_parts = from.split(File::Separator)
	t_parts = to.split(File::Separator)

	# base dir should be images
	expect(f_parts[0]).to eq('images')
	expect(t_parts[0]).to eq('images')

	# second part should match to/from
	expect(f_parts[1]).to eq(f_base)
	expect(t_parts[1]).to eq(t_base)

	# file name should match
	expect(f_parts[2]).to eq(t_parts[2])
      end
  end
end
