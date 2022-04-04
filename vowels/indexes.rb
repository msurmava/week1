# returns hash of vowels and their positions in alphabet
class VowelsPossitionInAlphabet
  POSITION = 1

  def initialize
    @vowels = {}
  end

  def call
    hash_of_vowels
  end

  private

  def find_position_of_a_vowel
    'a'.ord - POSITION
  end

  def hash_of_vowels
    @vowels = { 'a' => 'a'.ord - find_position_of_a_vowel,
                'e' => 'e'.ord  - find_position_of_a_vowel,
                'i' => 'i'.ord  - find_position_of_a_vowel,
                'o' => 'o'.ord  - find_position_of_a_vowel,
                'u' => 'u'.ord  - find_position_of_a_vowel }
  end
end

puts VowelsPossitionInAlphabet.new.call
