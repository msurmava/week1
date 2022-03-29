class Shop 
  def initialize
    @list = {}
    @price_quantitiy = []
  end
  def user_input
    loop do
    puts "Please enter item:"
    @name = gets.chomp()
    break if @name.downcase == "stop"
    puts "Please eneter price"
    @price = gets.chomp()
    puts "Please enter quantity:"
    @quantity = gets.chomp()
    @list[@name] = [@price.to_i,@quantity.to_i]
    end
    @list 
  end
  def plain_list
    user_input
  end
  def one_item_at_a_time
    user_input.each{|k,v| @list[k]=v.inject(:*)}
  end
  def total_sum
    one_item_at_a_time.values.inject(:+)
  end
end


  
puts Shop.new.one_item_at_a_time
