require_relative 'node'

class Trie
  attr_reader :root

  def initialize
    @root = Node.new("")
  end

  def add_word(word)
    base = root
      word.each_char do |char|
        if base.next.any? {|i| i.value ==  char}
          child = base.next.find {|i| i.value == char}
          base = child
        else
          child = Node.new(char)
          base.next << child
          base = child
        end
      end
    base.word = true
  end

  def find_word(word)
    base = root
    word.each_char do |char|
      if base.next.any? {|i| i.value ==  char}
        base = base.next.find {|i| i.value == char}
      else
        return false
      end
    end
    base
   end


   def include?(word)
    find_word(word)? true : false
   end

   def find?(word)
    data = find_word(word)
     if data 
      find_word(word).word
     else
      false
     end
   end

   def list(prefix)
    stack        = []
    words        = []
    prefix_stack = []
  
    stack        << find_word(prefix)
    prefix_stack << prefix.chars.take(prefix.size-1)
    return [] unless stack.first
  
    until stack.empty?
      node = stack.pop
  
      prefix_stack.pop and next if node == :smth
  
      prefix_stack << node.value
      stack        << :smth
  
      words << prefix_stack.join if node.word
  
      node.next.each { |n| stack << n }
    end
  
    words
  
   
  end
  end

   

    

trie = Trie.new

trie.add_word("cat")
trie.add_word("cap")
trie.add_word("cape")
trie.add_word("camp")
trie.add_word('bad')
trie.add_word('person')
p trie.list('ca')