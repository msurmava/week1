#calculates area of a triangle by base and height

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

puts Triangle.new(1,2).area