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
    assert_equal false, @board.coordinates_consecutive_in_column?(@submarine, ["B1", "B3"])
  end

  def test_valid_placement?
    @board.generate_cells #added this so the cells would
    # generate and overlap? method could access @cells empty? method
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end
    #testing overlap in valid valid_placement in interaction pattern
  def test_overlap_fuction_of_valid_placement?
    @board.generate_cells
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
  end

  def test_place
    @board.generate_cells
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_instance_of Cell , cell_1 = @board.cells["A1"]
    assert_instance_of Cell , cell_2 = @board.cells["A2"]
    assert_instance_of Cell , cell_3 = @board.cells["A3"]
    assert_instance_of Ship , cell_1.ship
    assert_instance_of Ship , cell_2.ship
    assert_instance_of Ship , cell_3.ship
    assert_equal true, cell_3.ship == cell_2.ship
  end
  #testing helper method overlap? before mingling with other working code
  def test_overlap?
    @board.generate_cells
    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal true, @board.overlap?(["A1", "B1"])
    assert_equal true, @board.overlap?(["A2", "B2"])
    assert_equal false, @board.overlap?(["B1", "C1"])
  end

  def test_render
    skip
    @board.generate_cells
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal "  1 2 3 4 \n" +
                 "A . . . . \n" +
                 "B . . . . \n" +
                 "C . . . . \n" +
                 "D . . . . \n", @board.render

    assert_equal  "  1 2 3 4 \n" +
                  "A S S S . \n" +
                  "B . . . . \n" +
                  "C . . . . \n" +
                  "D . . . . \n", @board.render(true)
  end

  def test_some_other_render
    skip
    @board.generate_cells
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.place(@submarine, ["C1", "D1"])
    @board.cells["A1"].fire_upon
    @board.cells["A2"].fire_upon
    @board.cells["A3"].fire_upon

    @board.cells["B4"].fire_upon
    @board.cells["C1"].fire_upon
    assert_equal "  1 2 3 4 \n" +
                 "A X X X . \n" +
                 "B . . . M \n" +
                 "C H . . . \n" +
                 "D . . . . \n", @board.render

    assert_equal  "  1 2 3 4 \n" +
                  "A X X X . \n" +
                  "B . . . M \n" +
                  "C H . . . \n" +
                  "D S . . . \n", @board.render(true)
  end
end
