# frozen_string_literal: true

# Bubble sorts array of numbers
class BublesortService
  class AttributeError < StandardError; end

  SUBTRACTOR = 1
  NEXT = 1

  def initialize(number = [])
    @numbers = number
    @sorted = []
  end

  def call
    validate_parameters
    sort_numbers
  rescue AttributeError => e
    e.message
  end

  # private

  def numbers_length
    @numbers.length
  end

  def sort_numbers
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

  def same_type?
    @numbers.map(&:class).uniq.length == 1
  end

  def array_given?
    @numbers.is_a?(Array)
  end

  def invalid_elements
    !same_type? || !array_given? || @numbers.empty?
  end

  def validate_parameters
    raise AttributeError, 'Invalid Input' if invalid_elements
  end
end

p BublesortService.new({:ok => 5}).call
