# calculates area of a triangle by base and height
class CalculateTriangleAreaService
  class AttributeError < StandardError; end

  DIVIDER = 2

  def initialize(base, height)
    @base = base.to_f
    @height = height.to_f
  end

  def call
    validate_parameters
    area
  rescue AttributeError => e
    warn e
  end

  private

  def parameter_number?
    @base.to_s.scan(/\D/).empty? && @height.to_s.scan(/\D/).empty?
  end

  def validate_parameters
    return unless @base <= 0 || @height <= 0 || parameter_number?

    raise AttributeError, 'Parameters must be positive numbers!'
  end

  def area
    @base * @height / DIVIDER
  end
end

puts CalculateTriangleAreaService.new(1, "7").call
