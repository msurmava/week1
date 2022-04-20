# Bubble sorts array of numbers
class BublesortService
  class AttributeError < StandardError; end

  SUBTRACTOR = 1
  NEXT = 1

  def initialize(number = [])
    @number = number
    @sorted = []
  end

  def call
    validate_parameters
    sort_numbers
  rescue AttributeError => e
    e.message
  end

  private

  def numbers_length
    @numbers.length
  end

  def sort_numbers
    @numbers = @number.map(&:to_i)
    loop do
      change_made = false

      (numbers_length - SUBTRACTOR).times do |index|
        if @numbers[index] > @numbers[index + NEXT]
          @numbers[index], @numbers[index + NEXT] = @numbers[index + NEXT], @numbers[index]
          change_made = true
        end
      end

      break unless change_made
    end
    @numbers
  end

  def all_numeric?
    @number.select { |element| element.to_s.scan(/\D/).empty? }.length == @number.length
  end

  def array_given?
    @number.is_a?(Array)
  end

  def validate_parameters
    return unless !all_numeric? || !array_given? || @number.empty?

    raise AttributeError, 'please give me an array of numbers'
  end
end

p BublesortService.new([]).call
