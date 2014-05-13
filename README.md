## Image Analyzer

### Usage
Run the program from the image-analyzer directory
the filepaths are not absolute therefore a command
should look like:
ruby bin/imageanalyzer --task RUN

```
Usage: image_analyzer.rb [options]
	--start N                    Search at the Nth result and start indexing at the Nth filename
	--size N                     Search for and save the N images.
	--task [DOWNLOAD|RUN]        Download images or run images through pipeline.
	--pipeline p1,p2,p3          Designate which parts of the pipeline to run.

```

### Installation
tesseract needs to be able to be run from
the command line. Follow their instructions
to install.

### Dependencies
1. ruby gems
   1. google-search
   2. tesseract-ocr (interface for c program)
2. c programs
   1. tesseract-ocr
