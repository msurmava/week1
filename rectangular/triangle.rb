# Cheks what kind of triangle user has
class WhatKindOfTriangle
  POWER_2 = 2
  ZERO = 0

  def initialize
    @sides = []
    puts 'Enter triangle side (cm):'
    @sides << gets.chomp.to_i
    puts 'Enter another triangle side (cm):'
    @sides << gets.chomp.to_i
    puts 'Enter another triangle side (cm):'
    @sides << gets.chomp.to_i
    @sides.sort!.reverse!
  end

  def call
    validate_parameters
    just_rectangular_message
    just_isosceles_message
    rectangular_and_isosceles_message
    equilateral_and_isosceles_message
    just_triangle_message
    not_triangle_message
  end

  private

  def validate_parameters
    return unless @sides.include?(0)

    warn 'parameter not supported'
    exit 1
  end

  def triangle?
    compare_two_sides = @sides[0] < @sides[1] + @sides[2]
    side1_not_zero = @sides[0] != ZERO
    side2_not_zero = @sides[1] !=  ZERO
    side3_not_zero = @sides[2] !=  ZERO
    compare_two_sides &&  side1_not_zero && side2_not_zero && side3_not_zero
  end

  def rectangular?
    @sides[0]**POWER_2 == @sides[1]**POWER_2 + @sides[2]**POWER_2
  end

  def isosceles?
    @sides[1] == @sides[2] || @sides[0] == @sides[1]
  end

  def equilateral?
    @sides[0] == @sides[1] && @sides[1] == @sides[2]
  end

  def just_rectangular_message
    puts  'Your triangle is rectangular!' if rectangular? && !isosceles? && triangle?
  end

  def rectangular_and_isosceles_message
    puts  'Your triangle is rectangular and isosceles!' if rectangular? && isosceles? && triangle?
  end

  def just_isosceles_message
    puts 'Your triangle is isosceles!' if isosceles? && triangle? && !rectangular? && !equilateral?
  end

  def equilateral_and_isosceles_message
    puts 'Your triangle is equilateral and isosceles!' if equilateral? && triangle?
  end

  def just_triangle_message
    if triangle? && !equilateral? && !rectangular? && !isosceles?
      puts 'Your triangle is not equlateral, isosceler or rectangular!'
    end
  end

  def not_triangle_message
    puts 'This is not a triangle' unless triangle?
  end
end

WhatKindOfTriangle.new.call
