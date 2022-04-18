# chooses best options
class StockPickService
  class AttributeError < StandardError; end

  REGEX_FOR_NUMBER = /^(\d)+$/.freeze
  INDEX_SUBTRACTOR = 1

  def initialize(prices)
    @prices = prices
  end

  def call
    validate_parameters
    days
  rescue AttributeError => e
    warn e
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

  def valid_numbers?
    @prices.all? { |item| item.to_s.match(REGEX_FOR_NUMBER) }
  end

  def validate_parameters
    return if valid_numbers?

    raise AttributeError, ' you entered invalid parameters'
  end
end

puts StockPickService.new([17, 3, 6, 9, 1, 20, 1, 8, 20, 20]).call


