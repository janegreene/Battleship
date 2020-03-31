require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/turn'


class TurnTest < Minitest::Test
  def test_it_can_take_players
    user = Player
  end


end

# Turn:
#
# User board is displayed showing hits, misses, sunken ships, and ships
    # create board for user, render, render(true)
    # create board for computer, render, render(true)
# Computer board is displayed showing hits, misses, and sunken ships

# Computer chooses a random shot
    # something like coordinates.sample
# Computer does not fire on the same spot twice
    #only fire if coordinate houses anything other than "."
# User can choose a valid coordinate to fire on
    #input validation using @coordinates otherwise promt to repick
# Entering invalid coordinate prompts user to enter valid coordinate

# Both computer and player shots are reported as a hit, sink, or miss
  #declare to the user what the result of their shot is
# User is informed when they have already fired on a coordinate
  # promt to pick another spot
# Board is updated after a turn
  #render
