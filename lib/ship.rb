
# pry(main)> cruiser.hit
#
# pry(main)> cruiser.health
# #=> 2
#
# pry(main)> cruiser.hit
#
# pry(main)> cruiser.health
# #=> 1
#
# pry(main)> cruiser.sunk?
# #=> false
#
# pry(main)> cruiser.hit
#
# pry(main)> cruiser.sunk?
# #=> true
class Ship
attr_reader :name, :length, :health
  def initialize(name, length)
    @name = name
    @length = length
    @health = health
  end

  def health
    @health = @length

   #coming back to this with modifier for subtracting health
   #this just sets initial value of health
  end

  def sunk?
    if @health > 0
      false
    else
      true
    end
  end

  def hit
    #require "pry"; binding.pry
    @health -= 1

    #require "pry"; binding.pry
  end
end
