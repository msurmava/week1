#returns language names with name length
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
    langswithnums = @languages.map {|lang| @hash = {lang => lang.length}}.reduce Hash.new, :merge
  end
end

puts CountingLaguageCharacters.new.call
