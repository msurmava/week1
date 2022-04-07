#returns language names with name length
class CountingLaguageCharacters

  LANGUAGES = %w[Ruby Python Java .NET HTML JavaScript].freeze

  def initialize
    @hash = {}
  end

  def call 
    create_hash_of_languages
  end

  private

  def create_hash_of_languages
    LANGUAGES.map {|lang| @hash = {lang => lang.length}}.reduce Hash.new, :merge
  end
end

puts CountingLaguageCharacters.new.call


