
def process(fromfile,tofile)
  system("tesseract #{fromfile} #{tofile} -l eng")
end

process(ARGV[0],ARGV[1])
