# Returns hash of language name - namelength pairs
class CountingLaguageCharacters
  def initialize
    @hash = {}
    @languages = ['Ruby', 'Python', 'Java', '.NET', 'HTML', 'JavaScript']
  end

  def call
    create_hash_of_languages
  end

  private

  def create_hash_of_languages
    @languages.map { |lang| @hash = { lang => lang.length } }.reduce({}, :merge)
  end
end

puts CountingLaguageCharacters.new.call
