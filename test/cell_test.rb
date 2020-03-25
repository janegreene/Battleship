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

  def test_render
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)
    @cell.fire_upon

    assert_equal true, @cell.fired_upon?
    assert_equal "H", @cell.render

    cell_1 = Cell.new("B4")
    assert_equal ".", cell_1.render
    cell_1.fire_upon
    assert_equal "M", cell_1.render

    cell_2 = Cell.new("C3")
    cell_2.place_ship(cruiser)
    assert_equal ".", cell_2.render

    assert_equal "S", cell_2.render(true)

    cell_2.fire_upon

    assert_equal "H", cell_2.render

    assert_equal false, cruiser.sunk?

    cruiser.hit
    cruiser.hit

    assert_equal true, cruiser.sunk?
    assert_equal "X",  cell_2.render
  end

  def test_health_declines
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)

    assert_equal false, @cell.fired_upon?

    @cell.fire_upon
    assert_equal 2, @cell.ship.health

    assert_equal true,  @cell.fired_upon?
  end

end
