#caesaer cypher
class CaesarCypherService
  class AttributeError < StandardError; end

  FIRST_DOWNCASE = 96
  LAST_DOWNCASE = 122
  FIRST_UPCASE =  64
  LAST_UPCASE = 90
  SUBTRACTOR = 26
  REGEX_FOR_NUMBER = /^(\d)+$/.freeze

  def initialize
    puts 'enter word'
    @word = gets.chomp
    puts 'enter number'
    @number = gets.chomp
    @cypher_size = @number.to_i
  end

  def call
    validate_parameters
    numbers_to_characters
  rescue AttributeError => e
    warn e
  end

  private

  def char_to_num
    @word.chars.map { |char| char.ord + @cypher_size }
  end

  def corrects_order
    char_to_num.map do |i|
      i > LAST_DOWNCASE || (i > LAST_UPCASE && i <= LAST_UPCASE + @cypher_size) ? i - SUBTRACTOR : i
    end
  end

  def leaves_just_characters
    corrects_order.map do |i|
      (i > FIRST_UPCASE && i <= LAST_UPCASE) || (i >= FIRST_DOWNCASE && i <= LAST_DOWNCASE) ? i : i - @cypher_size
    end
  end

  def numbers_to_characters
    leaves_just_characters.map(&:chr).join
  end

  def invalid_word
    @word.empty? || !@word.is_a?(String)
  end

  def empty_num?
    @number == ''
  end

  def valid_cypher_size
    @number.scan(/\D/).empty?
  end

  def validate_parameters
    return unless invalid_word || !valid_cypher_size || empty_num?

    raise AttributeError, 'not valid parameters'
  end
end

puts CaesarCypherService.new.call


