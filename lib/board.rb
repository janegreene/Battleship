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
    return first_letter_of_coordinate.uniq.compact.length == 1
  end

  def coordinates_are_in_same_column?(ship_object, coordinate_array)
    number_of_coordinate = []
    coordinate_array.each do |coordinate|
      number_of_coordinate << coordinate[1]
    end
    number_of_coordinate.uniq.compact.length == 1
  end


  def coordinates_consecutive_in_row?(ship_object, coordinate_array)
    if coordinates_are_in_same_row?(ship_object, coordinate_array) == true
      number_of_coordinate = []
      coordinate_array.each do |coordinate|
        number_of_coordinate << coordinate[1].to_i
      end
      number_of_coordinate.each_cons(2).all? do |coordinate_num1,coordinate_num2|
        coordinate_num2 == coordinate_num1 + 1
        #trying to see that numbers of coordinates are consecutive ie [1,2,3] or [3,4]
      end
    end
  end

  # def consecutive_in_column?(ship_object, coordinate_array)
  #will validate that coordinates are [A,B,C] or [C,D]... consecutive letters
  #
  #
  # end
  #
  # def valid_placement?(ship_object, coordinate_array)
   #will use all helper methods above
  #   if ship_length_equal_to_coordinate_length
  #     coordinate_array.each do |coordinate|
  #       coordinate[0][0] == coordinate[1][0]
  #     end
  #   end
  # end
end
