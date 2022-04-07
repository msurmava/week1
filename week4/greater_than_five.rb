# counts how many numbers greater than five
class NumbersGreaterThanFive
  def initialize(numbers)
    @numbers = numbers
  end

  def call
    result_message
  rescue AttributeError => e
    warn e
  end

  private

  def map_numbers
    @numbers.select { |item| item.to_i > 5 }.length
  end

  def result_message
    "There are #{map_numbers} numbers greater than 5"
  end

  def number?
    @numbers.all? { |item| item.is_a?(Integer) }
  end

  def validate_parameters
    return unless array_of_numbers.empty? || !is_number?

    raise AttributeError, 'please enter just numbers'
  end
end

puts NumbersGreaterThanFive.new([45, 454]).call


