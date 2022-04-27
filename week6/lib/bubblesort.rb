# Bubble sorts array 
class BublesortService
  class AttributeError < StandardError; end

  SUBTRACTOR = 1
  NEXT = 1
  UNIQUE = 1

  def initialize(elements = [])
    @elements = elements
    @sorted = []
  end

  def call
    validate_parameters
    sort_elements
  rescue AttributeError => e
    e.message
  end
 
  private

  def elements_length
    @elements.length
  end

  def sort_elements
    loop do
      change_made = false

      (elements_length - SUBTRACTOR).times do |index|
        if @elements[index] > @elements[index + NEXT]
          @elements[index], @elements[index + NEXT] = @elements[index + NEXT], @elements[index]
          change_made = true
        end
      end

      break unless change_made
    end
    @elements
  end

  def same_type?
    @elements.map(&:class).uniq.length == UNIQUE
  end

  def array_given?
    @elements.is_a?(Array)
  end

  def invalid_elements
    !same_type? || !array_given? || @elements.empty?
  end

  def validate_parameters
    raise AttributeError, 'Invalid Input' if invalid_elements
  end
end

BublesortService.new([1,2,3,1,2,5,25,6,56,7]).call
