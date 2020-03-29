class Cell
  attr_reader :coordinate, :ship, :board_output

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
    @board_output = "."
  end

  def place_ship(ship_object)
    @ship = ship_object
  end

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
       @board_output = "."
    elsif @fired_upon == true && @ship == nil
        @board_output = "M"
    elsif @fired_upon == true && @ship != nil && @ship.health > 0
        @board_output = "H"
    elsif @fired_upon == false && @ship != nil && visible
        @board_output =  "S"
    elsif @fired_upon == false && @ship == nil && visible
        @board_output = "."
    elsif @ship.health == 0
        @board_output =  "X"
    end
    require "pry"; binding.pry
    @board_output
  end

end
