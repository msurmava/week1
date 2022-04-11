# Caesar Cypher encoder
class CaesarCypherService
  class AttributeError < StandardError; end

  def initialize
    puts 'enter word'
    @word = gets.chomp
  end

  def call
    validate_parameters
    puts just_characters
  rescue AttributeError => e
    warn e
  end

  private

  def char_to_num
    @word.chars.map { |char| char.ord + 5 }.map { |i| i >= 123 || (i > 90 && i < 96) ? i - 26 : i }
  end

  def just_characters
    char_to_num.map { |i| (i >= 69 && i <= 90) || (i >= 101 && i <= 122) ? i : i - 5 }.map(&:chr).join
  end

  def validate_parameters
    return unless @word.empty? || !@word.is_a?(String)

    raise AttributeError, 'not valid parameters'
  end
end

CaesarCypherService.new.call
