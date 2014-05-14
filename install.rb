
def makeIfNotExist(path)
  if !Dir.exist?(path)
    puts "creating directory #{path}"
    Dir.mkdir(path)
  end
end

pipes = [ 'filter','tesseract','sobel','laplace',
  'results','raw','test','test-results'
]
pipes.each do |name|
  makeIfNotExist(File.join('images',name))
end
