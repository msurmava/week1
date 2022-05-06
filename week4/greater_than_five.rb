# counts how many numbers greater than five
class NumbersGreaterThanFive
  class AttributeError < StandardError; end

  NUMBER_TO_COMPARE = 5
  REGEX_FOR_NUMBER = /^(\d)+$/.freeze
  WITHOUTLASTELEMENT = (0..-2).freeze

  def initialize
    @number = []
  end

  def call
    user_input
    validate_parameters
    result_message
  rescue AttributeError => e
    warn e
  end

  private

  def user_input
    loop do
      puts 'please eneter number (stop- to stop)'
      @number << gets.chomp
      break if @number.last == 'stop'
    end
  end

  def map_numbers
    @number[WITHOUTLASTELEMENT].select { |item| item.to_i > NUMBER_TO_COMPARE }.length
  end

  def result_message
    "There are #{map_numbers} numbers greater than 5"
  end

  def number?
    @number[WITHOUTLASTELEMENT].all? { |item| item.match(REGEX_FOR_NUMBER) }
  end

  def validate_parameters
    return unless @number[WITHOUTLASTELEMENT].empty? || !number?

    raise AttributeError, 'please enter just numbers'
  end
end

puts NumbersGreaterThanFive.new.call


