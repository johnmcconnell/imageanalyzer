
def process(fromfile,tofile)
  system("./third-party/opencv-2.4.9/sobel/sobel #{fromfile} #{tofile}")
end

process(ARGV[0],ARGV[1])
