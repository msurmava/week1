# calculates ideal weight by height
class IdealWeightCounter
  SUBTRACTOR = 110
  EDGE = 0

  def initialize
    puts  'Enter your name:'
    @name = gets.chomp
    puts  'Enter your height'
    @height = gets.chomp.to_i
  end

  def call
    validate_parameters
    calculate_ideal_weight
    ideal_weight? ? already_opimal_weight_message : ideal_weight_message
  end

  private

  def calculate_ideal_weight
    @ideal = @height - SUBTRACTOR
  end

  def already_opimal_weight_message
    "#{@name.capitalize}, your weight is already optimal!"
  end

  def ideal_weight_message
    "#{@name.capitalize}, your ideal weight is #{@ideal} kgs!"
  end

  def ideal_weight?
    @ideal < EDGE
  end

  def validate_parameters
    return unless @height <= 0

    warn "#{@name.capitalize}, you entered invalid height"
    exit 1
  end
end

puts IdealWeightCounter.new.call
