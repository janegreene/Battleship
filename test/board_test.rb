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
  skip
    @board.generate_cells
    expected = {"A1" => Cell.new("A1"),
       "A2" => Cell.new("A2"),
       "A3" => Cell.new("A3"),
       "A4" => Cell.new("A4"),
       "B1" => Cell.new("B1"),
       "B2" => Cell.new("B2"),
       "B3" => Cell.new("B3"),
       "B4" => Cell.new("B4"),
       "C1" => Cell.new("C1"),
       "C2" => Cell.new("C2"),
       "C3" => Cell.new("C3"),
       "C4" => Cell.new("C4"),
       "D1" => Cell.new("D1"),
       "D2" => Cell.new("D2"),
       "D3" => Cell.new("D3"),
       "D4" => Cell.new("D4")
       }
    assert_equal expected, @board.cells
    assert_equal 16, @board.cell.length
  end

  def it_has_a_valid_coordinate
  assert_equal true, board.valid_coordinate?("A1")
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
