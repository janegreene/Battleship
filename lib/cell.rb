class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
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

  def render(default = false)
    return "." if @fired_upon == false && default == false
    return "M" if @fired_upon == true && @ship == nil
    return "H" if @fired_upon == true && @ship != nil && @ship.health > 0
    return "S" if @fired_upon == false && @ship != nil && default
    return "." if @fired_upon == false && @ship == nil && default
    return "X" if @ship.health == 0
  end
end
