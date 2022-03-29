class Triangle
  AREA = 1/2.to_f
  def initialize(base,height)
      @base = base
      @height = height
  end
  def area
    @base * @height * AREA
  end
end
