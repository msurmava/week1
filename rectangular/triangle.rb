# Cheks what kind of triangle user has

POWER_2 = 2
TOCOMPARE = 0

class Triangles
  def initialize
    @sides  = []
    puts  "Enter triangle side (cm):"
    @sides << gets.chomp.to_i
    puts  "Enter another triangle side (cm):"
    @sides << gets.chomp.to_i
    puts  "Enter another triangle side (cm):"
    @sides << gets.chomp.to_i
    @sides.sort!.reverse!
  end

  
  def validate_parameters
    if  @sides.include?(0)
    warn "parameter not supported"
    exit 1
    end
  end

  def triangle?
    compare_two_sides = @sides[0] < @sides[1] + @sides[2] 
    side1_not_zero = @sides[0]  !=  TOCOMPARE 
    side2_not_zero = @sides[1] !=  TOCOMPARE
    side3_not_zero = @sides[2] !=  TOCOMPARE
    compare_two_sides &&  side1_not_zero  &&  side2_not_zero  &&  side3_not_zero
  end

  def rectangular?
    @sides[0] **  POWER_2 == @sides[1]  **  POWER_2 + @sides[2] **  POWER_2
  end

  def isosceles?
    @sides[1] == @sides[2] || @sides[0] ==  @sides[1]
  end

  def equilateral?
    @sides[0] ==  @sides[1] &&  @sides[1] ==  @sides[2]
  end

  def kind_of_triangle
    validate_parameters
    if rectangular? && !isosceles?  &&  triangle?
      puts  "Your triangle is rectangular!"
    elsif rectangular? && isosceles?  &&  triangle?
      puts "Your triangle is rectangular and isosceles!"
    elsif isosceles? && !equilateral?  &&  triangle?
      puts  "Your triangle is isosceles!"
    elsif equilateral?  &&  triangle?
      puts "Your triangle is equilateral and isosceles!"
    elsif triangle?
      puts "Your triangle is not equlateral, isosceler or rectangular!"
    else 
      puts "This is not a triangle"
    end
  end
end


Triangles.new.kind_of_triangle
