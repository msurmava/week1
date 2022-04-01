#calculates ideal weight by height

class IdealWeightCounter
    TOSUBTRACT = 100
    EDGE  = 0

    def initialize
      puts  "Enter your name:"
      @name = gets.chomp
      puts  "Enter your height"
      @height = gets.chomp.to_i
    end

    def call
      validate_parameters
      ideal = @height - TOSUBTRACT
      if ideal  < EDGE
        "#{@name.capitalize}, your weight is already optimal!"
      else
        "#{@name.capitalize}, your ideal weight is #{ideal} kgs!"
      end
    end

    private
    def validate_parameters
      if @height == 0
        warn "#{@name.capitalize}, you entered invalid height"
        exit 1
      end
    end
end


puts IdealWeightCounter.new.call
