require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_cells
    @board.generate_cells
    
    assert_instance_of Hash, @board.cells
    assert_equal 16, @board.cells.length
    assert_instance_of Cell, @board.cells.values.first
  end

  def test_it_has_a_valid_coordinate?
    @board.generate_cells
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end
#pry(main)> board.valid_coordinate?("A1")
# # => true
#
# pry(main)> board.valid_coordinate?("D4")
# # => true
#
# pry(main)> board.valid_coordinate?("A5")
# # => false
#
# pry(main)> board.valid_coordinate?("E1")
# # => false
#
# pry(main)> board.valid_coordinate?("A22")
# # => false

end
