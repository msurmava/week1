FOR_DISC = 2
TO_MULTIPLY = 4
FOR_ROOT = 2

class Equation
  
  def initialize(first_coeff,second_coeff,third_coeff)
    @first_coeff = first_coeff.to_f
    @second_coeff = second_coeff.to_f
    @third_coeff = third_coeff.to_f
    @root = []
  end

  def validate_parameters
    if @first_coeff == 0 || @second_coeff ==  0 ||  @third_coeff  ==  0
      warn  "parameters should not be 0!"
      exit 1
    end
  end

  def discriminant_calculation
    @discriminant =  @second_coeff**FOR_DISC - TO_MULTIPLY*@first_coeff*@third_coeff
  end

  def root_if_discriminant_zero
    @root << (-@second_coeff  + Math.sqrt(@discriminant)) / FOR_ROOT * @first_coeff
    puts "Discriminant is: #{@discriminant}, root for this equation is #{@root.join}"
  end

  def root_if_discriminant_negative
    puts "NEGATIVE DISCRIMINANT, equation has no ROOTS!"
  end

  def roots_if_discriminant_positive
    @root << (-@second_coeff  + Math.sqrt(@discriminant )) / FOR_ROOT * @first_coeff
    @root << (-@second_coeff  - Math.sqrt(@discriminant )) / FOR_ROOT * @first_coeff
    puts "Discriminant is: #{@discriminant}, this equation has two roots : #{@root[0]} and #{@root[-1]}"
  end
  
  def calculate_roots
    validate_parameters
    if discriminant_calculation.zero?
      root_if_discriminant_zero
    elsif discriminant_calculation.positive?
      roots_if_discriminant_positive
    else
      root_if_discriminant_negative
    end 
  end
end


Equation.new(1,-14,0).calculate_roots
