require_relative 'cell'
class Board
  attr_reader :cells
  def initialize
    @cells = @cells
    @coordinates = @coordinates

  end
  def generate_cells
    # @coordinates = [:A1, :A2, :A3,:A4,
    #   :B1, :B2, :B3, :B4,
    #   :C1, :C2, :C3,:C4,
    #   :D1, :D2, :D3, :D4]
    @coordinates = ["A1", "A2", "A3","A4",
      "B1", "B2", "B3", "B4",
      "C1", "C2", "C3","C4",
      "D1", "D2", "D3", "D4"]
    @cells = {}
    @coordinates.each do |coordinate|
      @cells[coordinate] = Cell.new(coordinate)
    end
    @cells
  end
  

end
