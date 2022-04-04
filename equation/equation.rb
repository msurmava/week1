# calcuates discriminant and roots for quadratic equation
class QuadraticEquationCalculator
  class AttributeError < StandardError; end

  FOR_DISC = 2
  TO_MULTIPLY = 4
  FOR_ROOT = 2

  def initialize(first_coeff, second_coeff, third_coeff)
    @first_coeff = first_coeff.to_f
    @second_coeff = second_coeff.to_f
    @third_coeff = third_coeff.to_f
    @root = []
  end

  def call
    validate_parameters
    discriminant_zero?
    discriminant_positive?
    discriminant_negative?
  rescue AttributeError => e
    warn e
  end

  private

  def validate_parameters
    return unless @first_coeff.zero? || @second_coeff.zero? || @third_coeff.zero?

    raise AttributeError, 'Invalid parameter!!!'
  end

  def discriminant_calculation
    @discriminant = @second_coeff**FOR_DISC - TO_MULTIPLY * @first_coeff * @third_coeff
  end

  def root_message
    @root << (-@second_coeff + Math.sqrt(@discriminant)) / FOR_ROOT * @first_coeff
    puts "Discriminant is: #{@discriminant}, root for this equation is #{@root.join}"
  end

  def no_root_message
    puts 'NEGATIVE DISCRIMINANT, equation has no ROOTS!'
  end

  def roots_message
    @root << (-@second_coeff + Math.sqrt(@discriminant)) / FOR_ROOT * @first_coeff
    @root << (-@second_coeff - Math.sqrt(@discriminant)) / FOR_ROOT * @first_coeff
    puts "Discriminant: #{@discriminant}, has two roots : #{@root[0]} and #{@root[-1]}"
  end

  def discriminant_zero?
    root_if_discriminant_zero if discriminant_calculation.zero?
  end

  def discriminant_positive?
    roots_message if discriminant_calculation.positive?
  end

  def discriminant_negative?
    no_root_message if discriminant_calculation.negative?
  end
end

QuadraticEquationCalculator.new(1, 4, 1).call
