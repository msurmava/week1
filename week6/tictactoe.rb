# frozen_string_literal: true

# tictacto game
class TicTacToeService
  SUBTRACTOR = 1
  TWO = 2
  IF_EVEN = 0

  def initialize
    @board = %w[1 2 3 4 5 6 7 8 9]
  end

  def call
    game
  end

  private

  def without_color(item)
    case item
    when 'X'
      "\e[31mX\e[0m"
    when 'O'
      "\e[32mO\e[0m"
    else
      item
    end
  end

  def board_look
    puts "|#{without_color(@board[0])}|#{without_color(@board[1])}|#{without_color(@board[2])}|"
    puts '|-----|'
    puts "|#{without_color(@board[3])}|#{without_color(@board[4])}|#{without_color(@board[5])}|"
    puts '|-----|'
    puts "|#{without_color(@board[6])}|#{without_color(@board[7])}|#{without_color(@board[8])}|"
  end

  def winning_combination
    one = (@board[0] == @board[1] && @board[1] == @board[2])
    two = (@board[3] == @board[4] && @board[4] == @board[5])
    three = (@board[6] == @board[7] && @board[7] == @board[8])
    four = (@board[0] == @board[3] && @board[3] == @board[6])
    five = (@board[1] == @board[4] && @board[4] == @board[7])
    six = (@board[2] == @board[5] && @board[5] == @board[8])
    seven = (@board[1] == @board[4] && @board[4] == @board[8])
    eight = (@board[2] == @board[4] && @board[4] == @board[6])

    @win = if one || two || three || four || five || six || seven || eight
             true
           else
             false
           end
  end

  def full_board
    @board.join.scan(/\D/).length == @board.length
  end

  def input_for_x
    new_input = false
    loop do
      puts "please enter number for \e[31mX\e[0m"
      board_look
      player_one = gets.chomp
      if @board[player_one.to_i - SUBTRACTOR] == player_one
        @board[player_one.to_i - SUBTRACTOR] = 'X'
        new_input = true
      else
        puts 'wrong number'
      end
      break if new_input == true
    end
  end

  def input_for_o
    new_input = false
    loop do
      puts "please enter number for \e[32mO\e[0m"
      board_look
      player_two = gets.chomp
      if @board[player_two.to_i - SUBTRACTOR] == player_two
        new_input = true
        @board[player_two.to_i - SUBTRACTOR] = 'O'
      else
        puts 'wrong number'
      end
      break if new_input == true
    end
  end

  def game
    loop do
      input_for_x
      break if winning_combination || full_board

      input_for_o
      break if winning_combination || full_board
    end
    if winning_combination && @board.join.scan(/\D/).length % TWO != IF_EVEN
      puts "\e[31mplayer one\e[0m you won"
    elsif winning_combination && @board.join.scan(/\D/).length % TWO == IF_EVEN
      puts "\e[32mplayer two\e[0m you won"
    else
      puts "Both loosers it's a draw!"
    end
  end
end

TicTacToeService.new.call
