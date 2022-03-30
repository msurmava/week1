#returns hash of vowels and their positions in alphabet.
class Index 

  POSITION = 1
  
    def initialize
      @vowels
    end

    def hash_of_vowels_with_indexes
      @vowels= { "a" => ("a".ord - "a".ord + POSITION),
        "e" => ("e".ord - "a".ord + POSITION),
        "i" => ("i".ord - "a".ord + POSITION),
        "o" => ("o".ord - "a".ord + POSITION),
        "u" => ("u".ord - "a".ord + POSITION)
      }
    end
end

 puts Index.new.hash_of_vowels_with_indexes