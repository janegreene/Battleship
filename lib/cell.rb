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
    elsif @fired_upon == true && @ship != nil && @ship.health >= 0
      "H"
    elsif @fired_upon == false && @ship != nil && visible
      "S"
    else
      "X"
    end

  end

end
