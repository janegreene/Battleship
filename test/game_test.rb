require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/turn'
require './lib/game'


class GameTest < Minitest::Test
  def setup
    @computers_board = Board.new
    @user_board = Board.new
    @game = Game.new
  end

  def test_it_exists
    assert_instance_of Game, @game
  end
end
# Main Menu:
# Welcome to BATTLESHIP
# Enter p to play. Enter q to quit.
#
# User is shown the main menu where they can play or quit
# Setup:
# Setup
# Once the User has chosen to play, you need to place the computer’s ships and the
#  players ships to set up the game.
#
# Computer Ship Placement
# The computer player should place their ships. The baseline computer should simply use
# random placements but still adhere to the valid placement rules from iteration 2.
# Player Ship Placement
# Next, the user places their ships. They should receive a short explanation of
# how to place along with a visual representation of their board (which should be
#  empty)
#
# Computer can place ships randomly in valid locations
    # .sample place_ship valid_placement (maybe given sample list)
# User can enter valid sequences to place both ships
    #taking user input get.chomp through valid_placement via runner file(we think)
# Entering invalid ship placements prompts user to enter valid placements
#user input wrapped in if statement to redirect new input if invaild
# End Game:
#
# Game ends when all the user’s ships are sunk
  # running the sunk after every turn, if both players ships are
  # sunk this needs to kick off end of game message
# Game ends when all the computer’s ships are sunk
# Game reports who won
# Game returns user back to the Main Menu
