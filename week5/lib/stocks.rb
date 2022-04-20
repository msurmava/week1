# chooses best options
class StockPickService
  class AttributeError < StandardError; end

  REGEX_FOR_NUMBER = /^(\d)+$/.freeze
  INDEX_SUBTRACTOR = 1

  def initialize(prices)
    @prices = prices
  end

  def call
    validate_if_number
    validate_if_suitable_numbers
    days
  rescue AttributeError => e
    e.message
  end

  private

  def pairs
    @prices.combination(2).to_a.select { |pair| pair.first < pair.last }
  end

  def subtract_prices
    pairs.map { |pair| pair.reverse.inject(&:-) }.map { |pair| [pair] }
  end

  def combined_result
    pairs.zip(subtract_prices).to_h
  end

  def best
    combined_result.select { |_, profit| profit == combined_result.values.max }.keys.flatten
  end

  def days
    [@prices.find_index(best.first), @prices.length - 1 - @prices.reverse.find_index(best.last)]
  end

  def validate_if_number
    return if @prices.all? { |item| item.is_a?(Numeric) }

    raise AttributeError, 'all parameters must be numbers'
  end

  def validate_if_suitable_numbers
    return unless best.empty?

    raise AttributeError, 'no way for benifit'
  end
end

puts StockPickService.new([1, 2, 3]).call


