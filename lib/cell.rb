

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
    @fired_upon = false
  end

  def place_ship(ship_name)
    @ship = ship_name
  end

  # def empty?
  #   if @ship == nil
  #     true
  #   else
  #     false
  #   end
  # end

  def fire_upon
    @fired_upon = true
    if @ship != nil
      @ship.hit
    end
  end

  def empty?
    @ship == nil
  end

  def fired_upon?
    @fired_upon
  end

  def render(visible = false)
    if @fired_upon == false && visible == false
      "."
    elsif @fired_upon == true && @ship == nil
      "M"
    elsif @fired_upon == true && @ship != nil && @ship.health != 0
      "H"
    elsif @fired_upon == false && @ship != nil && visible
      "S"
    else
      "X"
    end

  end

  # def render(visible = false)
  #   if visible == false
  #     if @hits > 0
  #       if empty? == false && @ship.health - @hits < @ship.length
  #        "H"
  #       elsif empty? == true
  #        "M"
  #       end
  #     elsif @hits > 0 && @ship.health - @hits == 0
  #       if empty? == false
  #        "X"
  #       elsif empty? == true
  #        "M"
  #       end
  #     elsif @hits == 0
  #       "."
  #     end
  #   #require "pry"; binding.pry
  #   elsif visible == true && @hits == 0
  #     "S"
  #   end
  # end


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
