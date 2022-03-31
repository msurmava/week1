#fibonacci numbers up to 100
LIMIT = 100

class Fibonacci
  def initialize
    @fib_nums = [1,1]
  end

  def up_to_100
    until @fib_nums[-1] > LIMIT
      @fib_nums  <<  @fib_nums[-1]  + @fib_nums[-2]
    end
    @fib_nums[0..-2]
  end

end


puts Fibonacci.new.up_to_100
