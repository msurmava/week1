# findslongestwordinarray
class FindLongestWord

  LANGUAGES = %w[Ruby Python Java .NET HTML JavaScript].freeze

  def call
    find_longest_word
  end

  private

  def find_longest_word
    LANGUAGES.sort_by(&:length).reverse.shift
  end
end

puts FindLongestWord.new.call


