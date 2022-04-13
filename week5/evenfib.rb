# sums all even fibonacci numbers up to certain number
class SumEvenFibonacciService
  class AttributeError < StandardError; end

  FIBONACCI_SEQUENCE = [1, 1]
  WITHOUT_LAST_ELEMENT = (0..-2).freeze
  BEFORE_LAST = -2
  REGEX_FOR_NUMBER = /^(\d)+$/.freeze

  def initialize(limit)
    @limit = limit
  end

  def call
    validate_parameters
    sums_even_numbers
  rescue AttributeError => e
    warn e
  end

  def create_fibonacci_sequence
    FIBONACCI_SEQUENCE << FIBONACCI_SEQUENCE.last + FIBONACCI_SEQUENCE[BEFORE_LAST] until FIBONACCI_SEQUENCE.last > @limit.to_i
    FIBONACCI_SEQUENCE[WITHOUT_LAST_ELEMENT]
  end

  def find_even_numbers
    create_fibonacci_sequence.select(&:even?)
  end

  def sums_even_numbers
    find_even_numbers.inject(:+)
  end

  def number?
    @limit.to_s.match?(REGEX_FOR_NUMBER)
  end

  def validate_parameters
    return unless @limit.to_s.empty? || !number?

    raise AttributeError, 'please enter number'
  end
end

puts SumEvenFibonacciService.new("55").call


