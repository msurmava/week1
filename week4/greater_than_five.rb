class AttributeError < StandardError; end

# counts how many numbers greater than five
class NumbersGreaterThanFive
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
      break if @number[-1] == 'stop'
    end
  end

  def map_numbers
    @number[0..-2].select { |item| item.to_i > 5 }.length
  end

  def result_message
    "There are #{map_numbers} numbers greater than 5"
  end

  def number?
    @number[0..-2].all? { |item| item.match(/^(\d)+$/) }
  end

  def validate_parameters
    return unless @number.empty? || !number?

    raise AttributeError, 'please enter just numbers'
  end
end

puts NumbersGreaterThanFive.new.call


