# fibonacci numbers up to 100
class FibonacciNubersUpToHundred
  LIMIT = 100

  def initialize
    @fib_nums = [1, 1]
  end

  def call
    fibonacci_sequence_generator
  end

  private

  def fibonacci_sequence_generator
    @fib_nums << @fib_nums[-1] + @fib_nums[-2] until @fib_nums[-1] > LIMIT
    @fib_nums[0..-2]
  end
end

puts FibonacciNubersUpToHundred.new.call
