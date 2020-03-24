class Ship
  attr_reader :name, :length, :health, :hits

  def initialize(name_of_ship, length_of_ship)
    @name = name_of_ship
    @length = length_of_ship
    @health = length_of_ship
    @hits = 0
  end

  def health
    @health = @length - @hits
  end

  def sunk?
    if @health == 0
      true
    else
      false
    end
  end

  def hit
    @hits += 1
  end

end
