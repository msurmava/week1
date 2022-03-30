# Cheks what kind of triangle user has

class Triangles
  POWER_2 = 2
  TOCOMPARE = 0

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

  def triangle?
    @sides[0] < @sides[1] + @sides[2] && @sides[0]  !=  TOCOMPARE &&  @sides[1] !=  TOCOMPARE &&  @sides[2] !=  TOCOMPARE
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