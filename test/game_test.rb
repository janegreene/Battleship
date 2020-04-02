require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
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
