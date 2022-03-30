#increments of five from 10 to 100
LIMIT = 100
NUMBER = 5

class Increments  
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