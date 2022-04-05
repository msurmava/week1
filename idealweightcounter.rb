# calculates ideal weight by height
class IdealWeightCounterService
  class AttributeError < StandardError; end

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
    ideal_weight
    ideal_weight? ? already_opimal_weight_message : ideal_weight_message
  rescue AttributeError => e
    warn e
  end

  private

  def ideal_weight
    @ideal_weight ||= @height - SUBTRACTOR
  end

  def already_opimal_weight_message
    "#{@name.capitalize}, your weight is already optimal!"
  end

  def ideal_weight_message
    "#{@name.capitalize}, your ideal weight is #{ideal_weight} kgs!"
  end

  def ideal_weight?
    ideal_weight < EDGE
  end

  def validate_parameters
    return unless @height <= 0

    raise AttributeError, "#{@name.capitalize}, you entered invalid height"
  end
end

puts IdealWeightCounterService.new.call


