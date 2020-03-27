require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
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

  def test_it_has_a_valid_coordinate
    @board.generate_cells
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_coordinates_equal_ship_length
    assert_equal false, @board.ship_length_equals_coordinate_length?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.ship_length_equals_coordinate_length?(@submarine, ["A2", "A3", "A4"])
  end

  def test_coordinates_are_in_same_row
    assert_equal true, @board.coordinates_are_in_same_row?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.coordinates_are_in_same_row?(@cruiser, ["A1", "B2", "A4"])
  end

  def test_coordinates_in_same_column
    assert_equal false, @board.coordinates_are_in_same_column?(@cruiser, ["A1", "A2"])
    assert_equal true, @board.coordinates_are_in_same_column?(@cruiser, ["A1", "B1"])
  end

  def test_consecutive_in_row?
    assert_equal false, @board.coordinates_consecutive_in_row?(@cruiser, ["A1", "A2", "A4"])
    assert_equal true, @board.coordinates_consecutive_in_row?(@submarine, ["A1", "A2"])
    assert_equal false, @board.coordinates_consecutive_in_row?(@submarine, ["B1", "B3"])
  end

  def test_coordinates_consecutive_in_column?
    assert_equal false, @board.coordinates_consecutive_in_column?(@cruiser, ["A1", "B1", "D1"])
    assert_equal false, @board.coordinates_consecutive_in_column?(@submarine, ["A1", "C1"])
    refute @board.coordinates_consecutive_in_column?(@submarine, ["B1", "B3"])
  end


  # assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
  #
    # assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])

  # pry(main)> board.valid_placement?(submarine, ["A1", "C1"])
  # # => false
  #
  # pry(main)> board.valid_placement?(cruiser, ["A3", "A2", "A1"])
  # # => false
  #
  # pry(main)> board.valid_placement?(submarine, ["C1", "B1"])
  # # => false


end
