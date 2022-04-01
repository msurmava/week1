#calculates ideal weight by height

class Ideal_weight
    TOSUBTRACT = 100
    EDGE  = 0

    def initialize
      puts  "Enter your name:"
      @name = gets.chomp
      puts  "Enter your height"
      @height = gets.chomp.to_i
    end

    def validate_parameters
      if @height == 0
        warn "#{@name.capitalize}, you entered invalid weight"
        exit 1
      end
    end

    def optimal
      validate_parameters
      ideal = @height - TOSUBTRACT
      if ideal  < EDGE
        "#{@name.capitalize}, your weight is already optimal!"
      else
        "#{@name.capitalize}, your ideal weight is #{ideal} kgs!"
      end
    end
end


puts Ideal_weight.new.optimal
