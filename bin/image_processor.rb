
class ImageProcessor
  def initialize(name,func)
    @name = name
    @func = func
  end

  def process
    @func.call
  end
end

