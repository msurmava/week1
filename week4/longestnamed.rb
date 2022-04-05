# findslongestwordinarray
class FindLongestWord
  def initialize
    @words = ['Ruby', 'Python', 'Java', '.NET', 'HTML', 'JavaScript']
  end

  def call
    find_longest_word
  end

  private

  def find_longest_word
    @words.sort_by(&:length).reverse.shift
  end
end

puts FindLongestWord.new.call
