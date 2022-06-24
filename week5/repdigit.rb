# Finds if given number only contains one repetitive digit
class RepDigitDetectService
  class AttributeError < StandardError; end

  REGEX_FOR_NUMBER = /^(\d)+$/.freeze
  DESIRED_QUANTITY = 1

  def initialize
    puts 'enter number:'
    @number = gets.chomp
  end

  def call
    validate_parameters
    is_repetitive?
  rescue AttributeError => e
    warn e
  end

  private

  def digit_count
    @number.split('').uniq.length 
  end

  def is_repetitive?
    digit_count == DESIRED_QUANTITY ? true : false
  end

  def number?
    @number.match(REGEX_FOR_NUMBER)
  end

  def validate_parameters
    return unless @number.empty? || !number?

    raise AttributeError, 'please enter just numbers'
  end
end
puts RepDigitDetectService.new.call


