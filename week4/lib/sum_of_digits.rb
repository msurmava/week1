# sums up numbers of a range.
class SumOfDigitsService
  class AttributeError < StandardError; end

  def initialize(number_one = [], *number_two)
    @number_one = number_one
    @number_two = number_two
  end

  def call
    validate_parameters
    sum_of_the_range
  rescue AttributeError => e
    e.message
  end

  private

  def second_number
    @number_two.join.to_i
  end

  def range_of_numbers
    @number_one > second_number ? (second_number..@number_one).to_a : (@number_one..second_number).to_a
  end

  def sum_of_the_range
    range_of_numbers.inject(:+)
  end

  def second_parameter_not_integer
    @number_two.select { |element| element.is_a?(Integer) }.length != @number_two.length
  end

  def more_then_one?
    @number_two.length > 1
  end

  def validate_parameters
    return unless !@number_one.is_a?(Integer) || second_parameter_not_integer || more_then_one?

    raise AttributeError, 'Please, enter numbers!'
  end
end

puts SumOfDigitsService.new(4, 1).call
