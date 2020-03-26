require_relative 'cell'
class Board
  attr_reader :cells, :coordinates
  def initialize
    @cells = {}
    #@coordinates = generate_cells
    @coordinates = ["A1", "A2", "A3","A4",
        "B1", "B2", "B3", "B4",
        "C1", "C2", "C3","C4",
        "D1", "D2", "D3", "D4"]
  end

  def generate_cells
    # @coordinates = [:A1, :A2, :A3,:A4,
    #   :B1, :B2, :B3, :B4,
    #   :C1, :C2, :C3,:C4,
    #   :D1, :D2, :D3, :D4]
    @coordinates.each do |coordinate|
      @cells[coordinate] = Cell.new(coordinate)
    end
    @cells
    #require "pry"; binding.pry
  end

  def valid_coordinate?(specified_coordinate)
    @coordinates.any? do |coordinate|
      coordinate == specified_coordinate

    end
  end


end
