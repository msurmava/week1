require 'prime'

# counts prime numebers
class CountsPrimeNumberService
  class AttributeError < StandardError; end

  REGEX_FOR_NUMBER = /^(\d)+$/.freeze
  WITHOUT_LAST_ELEMENT = (0..-2).freeze

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
      break if @number.last == 'stop'
    end
  end

  def count_primes
    @number.select { |item| Prime.prime?(item.to_i) }.length
  end

  def result_message
    "You entered #{count_primes} prime numbers"
  end

  def number?
    @number[WITHOUT_LAST_ELEMENT].all? { |item| item.match(REGEX_FOR_NUMBER) }
  end

  def validate_parameters
    return unless @number.empty? || !number?

    raise AttributeError, 'please enter just numbers'
  end
end

puts CountsPrimeNumberService.new.call


