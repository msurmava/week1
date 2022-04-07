class AttributeError < StandardError; end

# calculate factorial of a given number
class CalculateFactorialService
  
  REGEX_FOR_NUMBER = /^(\d)+$/

  def initialize
    puts 'enter number'
    @number = gets.chomp
  end

  def call
    validate_parameters
    final_message
  rescue AttributeError => e
    warn e
  end

  private

  def factorial
    (1..@number.to_f).inject(1, :*)
  end

  def final_message
    "The factorial of #{@number} is #{factorial}."
  end

  def number?
    @number.match(REGEX_FOR_NUMBER)
  end

  def validate_parameters
    return unless @number.empty? || !number?

    raise AttributeError, 'please enter just number'
  end
end

puts CalculateFactorialService.new.call


