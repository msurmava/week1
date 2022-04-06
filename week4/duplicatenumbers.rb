class AttributeError < StandardError; end

#counts duplicate numbers from an array
class FindsDuplicateNumbersService
 def initialize
  @numbers = []
 end

 def call
  user_input
  validate_parameters
  final_message
rescue AttributeError => e
  warn e
  end

  private

  def user_input
    loop do 
    puts "number please (type 'OK' to stop)"
    @numbers << gets.chomp()
    break if @numbers[-1].upcase == "OK"
    end
  end

  def number_count
    @numbers[0..-2].group_by(&:itself).transform_values(&:count)
  end

  def duplicates
    number_count.select{|_,count| count > 1}.keys.map{|number| number.to_i}
  end

  def final_message
    duplicates.empty? ? "no duplicates to show" : duplicates
  end
  
  def valid_integer
    @numbers[0..-2].all? {|i| i.match(/^(\d)+$/) }
  end

  def empty_array
    @numbers.empty?
  end
  
  def validate_parameters
    return unless !valid_integer || empty_array
    
    raise AttributeError, "invlaid input"
  end
end

puts FindsDuplicateNumbersService.new.call


