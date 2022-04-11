# returns a hash that stores the indexes of each letter in an array.
class MapStringLettersService
  class AttributeError < StandardError; end

  NOT_NUMBER = '^0-9'

  def initialize
    puts 'please eneter a word'
    @word = gets.chomp
  end

  def call
    validate_parameters
    list_of_indexes
  rescue AttributeError => e
    warn e
  end

  private

  def separate_characters
    @word.downcase.split('')
  end

  def grouped_by_letter
    (0...separate_characters.length).map { |index| [index, separate_characters[index]] }.group_by(&:last)
  end

  def list_of_indexes
    list = grouped_by_letter.map { |letter, indexes| { letter => indexes.join.tr(NOT_NUMBER, '') } }
    list = list.reduce({}, :merge)
    list.map { |letter, index| { letter => index.split('').map(&:to_i) } }.reduce({}, :merge)
  end

  def validate_parameters
    return unless grouped_by_letter == {}

    raise AttributeError, 'EMPTY STRING'
  end
end

puts MapStringLettersService.new.call


