class Increments
  LIMIT = 100
  NUMBER = 5
  def initialize
    @numbers = [10]
  end
  def of_5
    until @numbers[-1] == LIMIT
    @numbers << @numbers[-1] +  NUMBER
    end
    @numbers  
  end
end  

puts Increments.new.of_5