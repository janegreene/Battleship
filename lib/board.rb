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
      #  require "pry"; binding.pry
      end
      answer = false
      number_of_coordinate.each_cons(2) do |coordinate_num1, coordinate_num2|
        answer = ((coordinate_num1 + 1) == coordinate_num2)
      end
      answer
    else
      false
    end
  end

  def coordinates_consecutive_in_column?(ship_object, coordinate_array)
    if coordinates_are_in_same_column?(ship_object, coordinate_array) == true
      letter_of_coordinate = []
      coordinate_array.each do |coordinate|
        letter_of_coordinate << coordinate[0]
      end
      answer = false
      letter_of_coordinate.each_cons(2) do |coordinate_letter1, coordinate_letter2|
        range = coordinate_letter1..coordinate_letter2
        letter_array = range.to_a
        answer = (letter_array.length == 2)
      end
      answer
    else
      false
    end
  end
  #WORKING prior to overlap?
  # def valid_placement?(ship_object, coordinate_array)
  #   if ship_length_equals_coordinate_length?(ship_object, coordinate_array) == true
  #     return true if coordinates_consecutive_in_column?(ship_object, coordinate_array) == true
  #     return true if coordinates_consecutive_in_row?(ship_object, coordinate_array) == true
  #     return false else
  #   return false
  #   end
  # end
  def valid_placement?(ship_object, coordinate_array)
    if ship_length_equals_coordinate_length?(ship_object, coordinate_array) == true
      return false if overlap?(coordinate_array) == true #new line had to reorder
      return true if coordinates_consecutive_in_column?(ship_object, coordinate_array) == true
      return true if coordinates_consecutive_in_row?(ship_object, coordinate_array) == true
      return false else
    return false
    end
  end

  def place(ship_placed, occupied_coordinates)
    occupied_coordinates.each do |occupied|
      @cells[occupied].place_ship(ship_placed)
    end
  end
  #attempt to build overlap helper method for valid_placement? method.
  # need to work into valid_placement
  def overlap?(prospect_coordinates)
    prospect_coordinates.any? do |prospect|
      #.any? returns true if block returns anything other than flasey
      # require "pry"; binding.pry
      return true if @cells[prospect].empty? == false
      #.empty? returns true is ship==nil
      # require "pry"; binding.pry
    end
  end
  #jacking around with render...
  # def render(default = nil)
  #   #if default = nil
  #   @cells.map do |key, value|
  #     #match each key to coordinate and show value via render
  #     @coordinates[0..3].map do |coordinate|
  #       if key == coordinate
  #         value.render
  #       end
  #     end
  #     # require "pry"; binding.pry
  #   end
  # end
    # "  1 2 3 4 \n" +
    # "A "#{@cellsvalue.render}" ". . . \n" +
    # "B . . . . \n" +
    # "C . . . . \n" +
    # "D . . . . \n",
    #@coordinates[1..3]
    # puts string_array.join(", ")
end
