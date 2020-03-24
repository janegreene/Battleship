

# pry(main)> cell.fired_upon?
# # => false
#
# pry(main)> cell.fire_upon
#
# pry(main)> cell.ship.health
# # => 2
#
# pry(main)> cell.fired_upon?
# # => true
class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def place_ship(ship_name)
    @ship = ship_name
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def fire_upon
    require "pry"; binding.pry
    @ship.health - 1
    require "pry"; binding.pry
  end

  def fired_upon?
    require "pry"; binding.pry
    if  @ship.health < @ship.length
      true
    else
      false
    end
  end


end
