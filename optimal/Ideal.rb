class Ideal_weight
    TOSUBTRACT = 100
    EDGE  = 0

    def initialize
      puts  "Enter your name:"
      @name = gets.chomp
      puts  "Enter your height"
      @height = gets.chomp.to_i
    end
    
    def optimal
      ideal = @height - TOSUBTRACT
      if ideal  < EDGE
        "#{@name.capitalize}, your weight is already optimal!"
      else
        "#{@name.capitalize}, your ideal weight is #{ideal} kgs!"
      end
    end
end
