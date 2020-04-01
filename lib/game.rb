# require_relative 'turn'
class Game
  attr_reader :user_input

  def initialize
    @user_input = nil
    @computers_board = Board.new
    @user_board = Board.new
    @user_cruiser = Ship.new("Cruiser", 3)
    @user_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)

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
      computer_board_initial_render
      # play_game #this method is pending!!!!!!!!!!!
    elsif @user_input == "q"
      end_game #this method is pending!!!!!!!!!!!
    else
      p "Enter p to play. Enter q to quit."
      @user_input = user_input_start
    end
  end

  def player_place_message_cruiser
    p "I have laid out my ships on the grid."
    p "You now need to lay out your two ships."
    p "The Cruiser is three units long and the Submarine is two units long."
    puts @user_board.render
    p "Enter the squares for the Cruiser (3 spaces):"
  end

  def player_cruise_placement
    player_place_message_cruiser
    cruiser_cell_a = gets.chomp
    cruiser_cell_b = gets.chomp
    cruiser_cell_c = gets.chomp
    cruiser_hopeful_placement = [cruiser_cell_a, cruiser_cell_b, cruiser_cell_c]
    placements_are_valid = cruiser_hopeful_placement.all? do |placement|
      @user_board.valid_coordinate?(placement)
    end
    if !placements_are_valid
       puts "Those are invalid coordinates. Please try again:"
       player_cruise_placement
    elsif placements_are_valid && @user_board.valid_placement?(@user_cruiser, cruiser_hopeful_placement)
      @user_board.place(@user_cruiser, cruiser_hopeful_placement)
    end
    puts @user_board.render(true)
    sleep(1)
    player_submarine_placement
  end

  def player_submarine_placement
    p "Enter the squares for the Submarine (2 spaces):"
    submarine_cell_a = gets.chomp
    submarine_cell_b = gets.chomp
    submarine_hopeful_placement = [submarine_cell_a, submarine_cell_b]
    placements_are_valid = submarine_hopeful_placement.all? do |placement|
      @user_board.valid_coordinate?(placement)
    end
    if !placements_are_valid
       puts "Those are invalid coordinates. Please try again:"
       player_submarine_placement
    elsif placements_are_valid && @user_board.valid_placement?(@user_submarine, submarine_hopeful_placement)
      @user_board.place(@user_submarine, submarine_hopeful_placement)
    end
    puts @user_board.render(true)
  end

  # def play_game
  #     # start the game
  #     #create computers_board & user_board
  #     #place ships
  #
  #     end
  # end
  def computer_board_initial_render
      possible_coordinates_cruiser = [['A1', 'A2', 'A3'], ['A2','A3','A4'], ['B1', 'B2', 'B3'], ['B2','B3','B4'], ['C1', 'C2', 'C3'], ['C2','C3','C4'], ['D1', 'D2', 'D3'], ['D2','D3','D4'], ['A1', 'B1', 'C1'], ['A2', 'B2', 'C2'], ['A3', 'B3', 'C3'], ['A4', 'B4', 'C4'], ['B1', 'C1', 'D1'], ['B2', 'C2', 'D2'], ['B3', 'C3', 'D3'], ['B4', 'C4', 'D4']]
      possible_coordinates_sub = [['A1', 'A2'], ['B1', 'B2'], ['C1', 'C2'], ['D1', 'D2'], ['A2', 'A3'], ['B2', 'B3'], ['C2', 'C3'], ['D2', 'D3'], ['A3', 'A4'], ['B3', 'B4'], ['C3', 'C4'], ['D3', 'D4'], ['A1', 'B1'], ['B1', 'C1'], ['C1', 'D1'], ['A2', 'B2'], ['B2', 'C2'], ['C2', 'D2'], ['A3', 'B3'], ['B3', 'C3'], ['C3', 'D3'], ['A4', 'B4'], ['B4', 'C4'], ['C4', 'D4']]
    if @computers_board.overlap?(possible_coordinates_sub.sample) == false
      # require "pry"; binding.pry
      @computers_board.place(@computer_submarine, possible_coordinates_sub.sample)
    elsif @computers_board.overlap?(possible_coordinates_cruiser.sample) == false
      @computers_board.place(@computer_cruiser, possible_coordinates_cruiser.sample)
    end
    puts @computers_board.render(true)
    sleep(2)
    player_cruise_placement
  end
end
