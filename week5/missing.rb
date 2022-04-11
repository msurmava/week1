# finds missing number from 1 to 10
class MissingNumberService
  class AttributeError < StandardError; end

  RANGE = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].freeze
  DESIRABLE_LENGTH = 9
  ZERO = 0
  NUMBER_OF_MISSINGS = 1

  def initialize
    @numbers = []
  end

  def call
    user_input
    validate_parameters
    find_missing_number
  rescue AttributeError => e
    warn e
  end

  private

  def user_input
    until @numbers.length == DESIRABLE_LENGTH
      puts 'enter number:'
      @numbers << gets.chomp.to_i
    end
  end

  def find_missing_number
    RANGE - @numbers
  end

  def valid_range_length
    @numbers.length == DESIRABLE_LENGTH
  end

  def each_element_unique
    @numbers.uniq.length == DESIRABLE_LENGTH
  end

  def zero?
    @numbers.include?(ZERO)
  end

  def one_missing?
    (RANGE - @numbers).length == NUMBER_OF_MISSINGS
  end

  def valid_range?
    valid_range_length && each_element_unique && !zero? && one_missing?
  end

  def validate_parameters
    return unless valid_range?

    raise AttributeError, 'not valid parameters'
  end
end

puts MissingNumberService.new.call


