# frozen_string_literal: true

# returns list of products, quantity and price and sums prices.
class OrderPriceCalculator
  def initialize
    @list = {}
    @price_quantitiy = []
  end

  def call
    puts plain_list
    validate_parameters
    puts one_item_at_a_time
    puts "your total is #{total_sum}"
  end

  private

  def validate_parameters
    return unless @price.to_f.zero? || @quantity.to_f.zero?

    warn 'not valid parameters'
    exit 1
  end

  def user_input
    loop do
      puts 'Please enter item:'
      @name = gets.chomp
      break if @name.downcase == 'stop'

      puts 'Please eneter price'
      @price = gets.chomp
      puts 'Please enter quantity:'
      @quantity = gets.chomp
      @list[@name] = [@price.to_i, @quantity.to_i]
      @price_quantitiy = [@price.to_i, @quantity.to_i]
    end
    @list
  end

  def plain_list
    user_input
  end

  def one_item_at_a_time
    @list.each { |name, _| @list[name] = @price_quantitiy.inject(:*) }
  end

  def total_sum
    one_item_at_a_time.values.inject(:+)
  end
end

OrderPriceCalculator.new.call
