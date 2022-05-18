# frozen_string_literal: true

$LOAD_PATH << '../prefix_trie'

class Node
  attr_accessor :word, :value, :next

  def initialize(value)
    @value = value
    @word = false
    @next = []
  end
end
