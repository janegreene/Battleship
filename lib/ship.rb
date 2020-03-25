class Ship
  attr_reader :name, :length, :health

  def initialize(name_of_ship, length_of_ship)
    @name = name_of_ship
    @length = length_of_ship
    @health = @length
  end

  def sunk?
    if @health <= 0
      true
    else
      false
    end
  end

  def hit
    @health -= 1
  end

end
