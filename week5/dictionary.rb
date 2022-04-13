# counts words included in given word from dictionary
class WordsFromDictionaryService
  class AttributeError < StandardError; end

  def initialize(word = '', dictionary = [])
    @word = word.downcase.split(' ')
    @dictionary = dictionary
  end

  def call
    validate_parameters
    couning_words
  rescue AttributeError => e
    warn e
  end

  private

  def words_that_include
    @dictionary.product(@word).select { |pair| pair.last.include?(pair.first) }
  end

  def words_from_dictionary
    words_that_include.map(&:first)
  end

  def couning_words
    words_from_dictionary.group_by(&:itself).transform_values(&:count)
  end

  def validate_parameters
    return unless couning_words.empty?

    raise AttributeError, 'nothing to show'
  end
end

dictionary = []
puts 'Please enter word '
word = gets.chomp
loop do
  puts 'please insert library(type "." to stop)'
  item = gets.chomp
  break if item == '.'

  dictionary << item
end

puts WordsFromDictionaryService.new(word, dictionary).call


