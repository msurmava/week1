#returns how many days are from 1st of January to a specific date
require "date"

class Mydate
  def initialize
    puts "enter date" 
    @day = gets.chomp().to_i
    puts "enter month"
    @month = gets.chomp().to_i
    puts "enter year"
    @year = gets.chomp().to_i
  end

  def date
    number_of_days = Date.new(@year,@month,@day).yday.to_s
  end
  
  def days_in_order
    if date[-1]  ==  "1" &&  date !=  "11"
      return date  + "st"
    elsif date[-1] ==  "2" &&  date !=  "12"
      return  date  + "nd"
    elsif date[-1] == "3"
      return date + "rd"
    else 
      return date  + "th"
    end    
  end   
end


puts Mydate.new.days_in_order