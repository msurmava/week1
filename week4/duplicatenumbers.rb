# counts duplicate numbers from an array
class FindsDuplicateNumbersService
  class AttributeError < StandardError; end

  REGEX_FOR_NUMBER = /^(\d)+$/.freeze
  WITHOUT_LAST_ELEMENT = (0..-2).freeze

  def initialize
    @numbers = []
  end

  def call
    user_input
    validate_parameters
    final_message
  rescue AttributeError => e
    warn e
  end

  private

  def user_input
    loop do
      puts "number please (type 'OK' to stop)"
      @numbers << gets.chomp
      break if @numbers.last.upcase == 'OK'
    end
  end

  def number_count
    @numbers[WITHOUT_LAST_ELEMENT].group_by(&:itself).transform_values(&:count)
  end

  def duplicates
    number_count.select { |_, count| count > 1 }.keys.map(&:to_i)
  end

  def final_message
    duplicates.empty? ? 'no duplicates to show' : duplicates
  end

  def valid_integer
    @numbers[WITHOUT_LAST_ELEMENT].all? { |element| element.match(REGEX_FOR_NUMBER) }
  end

  def empty_array
    @numbers.empty?
  end

  def validate_parameters
    return unless !valid_integer || empty_array

    raise AttributeError, 'invlaid input'
  end
end

puts FindsDuplicateNumbersService.new.call


