require 'date'
# returns how many days are from 1st of January to a specific date
class CountDaysFromNewYearService
  class AttributeError < StandardError; end

  def initialize
    puts 'enter date'
    @day = gets.chomp.to_i
    puts 'enter month'
    @month = gets.chomp.to_i
    puts 'enter year'
    @year = gets.chomp.to_i
  end

  def call
    validate_parameters
    puts date_in_order_adds_st
    puts date_in_order_adds_nd
    puts date_in_order_adds_rd
    puts date_in_order_adds_th
  rescue AttributeError => e
    warn e
  end

  private

  def validate_parameters
    return unless Date.valid_date?(@year, @month, @day) == false

    raise AttributeError, 'You entered date that is not valid, plase try again later.'
  end

  def date_to_string
    @number_of_days = Date.new(@year, @month, @day).yday.to_s
  end

  def date_in_order_adds_st
    date_to_string
    "#{@number_of_days}st" if @number_of_days[-1] == '1' && @number_of_days != '11'
  end

  def date_in_order_adds_nd
    date_to_string
    "#{@number_of_days}nd" if @number_of_days[-1] == '2' && @number_of_days != '12'
  end

  def date_in_order_adds_rd
    date_to_string
    "#{@number_of_days}rd" if @number_of_days[-1] == '3'
  end

  def date_in_order_adds_th
    date_to_string
    "#{@number_of_days}th" unless date_in_order_adds_nd || date_in_order_adds_rd || date_in_order_adds_st
  end
end

puts CountDaysFromNewYearService.new.call
