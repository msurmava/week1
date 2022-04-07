require 'prime'
class AttributeError < StandardError; end

# counts prime numebers
class SumOfPrimesService
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
      puts 'please eneter number (stop - to stop)'
      @number << gets.chomp
      break if @number[-1] == 'stop'
    end
  end

  def primes
    @number.select { |item| Prime.prime?(item.to_i) }
  end

  def sum_primes
    primes.map(&:to_i).inject(:+)
  end

  def result_message
    "the sum of primes is #{sum_primes}"
  end

  def number?
    @number[0..-2].all? { |item| item.match(/^(\d)+$/) }
  end

  def validate_parameters
    return unless @number.empty? || !number?

    raise AttributeError, 'please enter just numbers'
  end
end

puts SumOfPrimesService.new.call


