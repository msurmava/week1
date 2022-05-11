require_relative 'node'
require_relative 'csv_writer'

class Trie
  attr_reader :root

  def initialize
    @root = Node.new("")
    @container = CSVreadandwrite.new
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

   def list(prefix=nil)
    return words if prefix.nil?
    stack        = []
    words        = []
    prefix_stack = []
  
    stack        << find_word(prefix)
    prefix_stack << prefix.chars.take(prefix.size-1)
    return [] unless stack.first
  
    until stack.empty?
      node = stack.pop
  
      prefix_stack.pop and next if node == :value
  
      prefix_stack << node.value
      stack        << :value
  
      words << prefix_stack.join if node.word
  
      node.next.each { |n| stack << n }
    end  
    words   
  end

  def csv_write(word)
    @container.write(word)
  end

  def csv_read
    @container.read
  end
end

   

    

trie = Trie.new

trie.add_word("cat")
trie.add_word("cap")
trie.add_word("cape")
trie.add_word("camp")
trie.add_word('bad')
trie.add_word('person')
p trie.csv_read