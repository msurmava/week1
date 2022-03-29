class Ideal_weight
    CONST = 100
def initialize
    puts "Enter your name:"
    @name = gets.chomp
    puts "Enter your heigtht"
    @height = gets.chomp.to_f
end
def optimal  
    ideal= @height - CONST
    if ideal < 0
    return "Your weight is already optimal"
    else
    return "#{@name.capitalize}, your ideal weight is #{ideal} kgs."
    end
end
end