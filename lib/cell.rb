

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
  attr_reader :coordinate, :ship, :hits

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @hits = 0
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
    @hits += 1
    if empty? == false
      @ship.health - @hits
    end
    #require "pry"; binding.pry
  end

  def fired_upon?
    #require "pry"; binding.pry
    if  @ship.health - @hits == @ship.length
      false
    else
      true
    end
  end

  def render
    if @hits > 0
      if empty? == false && @ship.health - @hits < @ship.length
       "H"
      elsif empty? == true
       "M"
      end
    elsif @hits > 0 && @ship.health - @hits == 0
      if empty? == false
       "X"
      elsif empty? == true
       "M"
      end
    elsif @hits == 0
      "."
    end
  end


  #
  # # Indicate that we want to show a ship with the optional argument
  # pry(main)> cell_2.render(true)
  # # => "S"
  #
  # pry(main)> cell_2.fire_upon
  #
  # pry(main)> cell_2.render
  # # => "H"
  #
  # pry(main)> cruiser.sunk?
  # # => false
  #
  # pry(main)> cruiser.hit
  #
  # pry(main)> cruiser.hit
  #
  # pry(main)> cruiser.sunk?
  # # => true
  #
  # pry(main)> cell_2.render
  # # => "X"
end
