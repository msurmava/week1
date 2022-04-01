#calculates area of a triangle by base and height

class Triangle
  AREA = 1/2.to_f

  def initialize(base,height)
    @base = base.to_f
    @height = height.to_f
  end

  def validate_parameters
    if @base <= 0 || @height  <=  0
      warn "Parameters must be positive numbers!"
      exit 1
    end
  end

  def area
    validate_parameters
    @base * @height * AREA
  end
end

puts Triangle.new(1,"0").area
