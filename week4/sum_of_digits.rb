class AttributeError < StandardError; end

# sums up numbers of a range.
class SumOfDigitsService
  def initialize(number_one, number_two)
    @number_one = number_one
    @number_two = number_two
  end

  def call
    validate_parameters
    sum_of_the_range
  rescue AttributeError => e
    warn e
  end

  private

  def range_of_numbers
    @number_one > @number_two ? (@number_two..@number_one).to_a : (@number_one..@number_two).to_a
  end

  def sum_of_the_range
    range_of_numbers.inject(:+)
  end

  def validate_parameters
    return unless !@number_one.is_a?(Integer) || !@number_two.is_a?(Integer)

    raise AttributeError, 'Please, enter numbers!'
  end
end

puts SumOfDigitsService.new(1, 7).call


