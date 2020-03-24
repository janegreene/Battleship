require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def setup
    @cell = Cell.new("B4")
  end

  def test_it_exists
    assert_instance_of Cell, @cell
    assert_equal "B4", @cell.coordinate
  end

  def test_cell_has_ship
    assert_nil @cell.ship
  end

  def test_place_ship
    cruiser = Ship.new("Cruiser", 3)

    assert_equal cruiser, @cell.place_ship(cruiser)
  end

  def test_is_empty?
    assert_equal true, @cell.empty?

    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)
    assert_equal false, @cell.empty?
  end

  def test_fired_upon?
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)

    assert_equal false, @cell.fired_upon?

    @cell.fire_upon
    assert_equal true, @cell.fired_upon?
  end
end
