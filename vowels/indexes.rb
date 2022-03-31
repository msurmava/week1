#returns hash of vowels and their positions in alphabet.

POSITION = 1

class Index
  
  def initialize
    @vowels = {}
  end

  def find_position
    "a".ord - POSITION
  end

  def hash_of_vowels
      @vowels = { "a" => "a".ord - find_position,
        "e" => "e".ord  - find_position,
        "i" => "i".ord  - find_position,
        "o" => "o".ord  - find_position,
        "u" => "u".ord  - find_position
      }
    end

  def vowels_with_indexes
    hash_of_vowels
  end
end

 puts Index.new.vowels_with_indexes
 