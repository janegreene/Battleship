require_relative 'cell'
class Board
  attr_reader :cells, :coordinates

  def initialize
    @cells = {}
    @coordinates = ["A1", "A2", "A3", "A4",
        "B1", "B2", "B3", "B4",
        "C1", "C2", "C3", "C4",
        "D1", "D2", "D3", "D4"]
  end

  def generate_cells
    @coordinates.each do |coordinate|
      @cells[coordinate] = Cell.new(coordinate)
    end
    @cells
  end

  def valid_coordinate?(specified_coordinate)
    @coordinates.any? do |coordinate|
      coordinate == specified_coordinate
    end
  end

  def ship_length_equals_coordinate_length?(ship_object, coordinate_array)
    return ship_object.length == coordinate_array.length
  end

  def coordinates_are_in_same_row?(ship_object, coordinate_array)
    first_letter_of_coordinate = []
    coordinate_array.each do |coordinate|
      first_letter_of_coordinate << coordinate[0]
    end
    first_letter_of_coordinate.uniq.compact.length == 1
  end

  def coordinates_are_in_same_column?(ship_object, coordinate_array)
    number_of_coordinate = []
    coordinate_array.each do |coordinate|
      number_of_coordinate << coordinate[1]
    end
    number_of_coordinate.uniq.compact.length == 1
  end


  # def consecutive_in_column?(ship_object, coordinate_array)
  #   if coordinates_are_consecutive_horizontal? &&
  #
  #
  # end
  #
  # def valid_placement?(ship_object, coordinate_array)
  #   if ship_length_equal_to_coordinate_length
  #     coordinate_array.each do |coordinate|
  #       coordinate[0][0] == coordinate[1][0]
  #     end
  #   end
  # end
end
