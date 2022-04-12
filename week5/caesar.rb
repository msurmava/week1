# Caesar Cypher encoder
class CaesarCypherService
  class AttributeError < StandardError; end

  CYPHER_SIZE = 5
  SUBTRACTOR_FOR_LAST_FIVE = 26
  CHAR_DOWNC_U = 123
  UPC_LAST_FIVE_MIN = 90
  UPC_LAST_FIVE_MAX = 96
  UPC_MIN_EDGE = 69
  UPC_MAX_EDGE = 90
  DOWNC_MIN_EDGE = 101
  DOWNC_MAX_EDGE = 122

  def initialize
    puts 'enter word'
    @word = gets.chomp
  end

  def call
    validate_parameters
    puts numbers_to_characters
  rescue AttributeError => e
    warn e
  end

  private

  def char_to_num
    @word.chars.map { |char| char.ord + CYPHER_SIZE }
  end

  def corrects_order
    char_to_num.map do |i|
      i >= CHAR_DOWNC_U || (i > UPC_LAST_FIVE_MIN && i < UPC_LAST_FIVE_MAX) ? i - SUBTRACTOR_FOR_LAST_FIVE : i
    end
  end

  def leaves_just_characters
    corrects_order.map do |i|
      (i >= UPC_MIN_EDGE && i <= UPC_MAX_EDGE) || (i >= DOWNC_MIN_EDGE && i <= DOWNC_MAX_EDGE) ? i : i - CYPHER_SIZE
    end
  end

  def numbers_to_characters
    leaves_just_characters.map(&:chr).join
  end

  def validate_parameters
    return unless @word.empty? || !@word.is_a?(String)

    raise AttributeError, 'not valid parameters'
  end
end

CaesarCypherService.new.call


