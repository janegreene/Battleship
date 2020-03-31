# require_relative 'turn'
class Game
  attr_reader :user_input

  def initialize
    @user_input = nil
  end

  def user_input_start
    gets.chomp
    #.downcase
  end

  def game_start
    p "Main Menu:"
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    @user_input = user_input_start
    if @user_input == "p"
      play_game
    elsif @user_input == "q"
      end_game
    else
      p "Enter p to play. Enter q to quit."
      @user_input = user_input_start
    end
  end

  def play_game
      # start the game
      #create computers_board & user_board
      #place ships

      end
  end



end
