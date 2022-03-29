class Fibonacci
  def initialize
    @fib_nums = [1,1]
  end
  def up_to_100
    until @fib_nums[-1] > 100
      @fib_nums  <<  @fib_nums[-1]  + @fib_nums[-2]
    end
    @fib_nums.delete(@fib_nums[-1])
    @fib_nums
  end
end


puts Fibonacci.new.up_to_100