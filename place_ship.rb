require_relative 'screen_stuff'

class Battleship

  def initialize
    @board = Array.new(10){Array.new(10){"."}}
    @craft = ["C", "R", "A", "F", "T"]
    @ship = ["S", "H", "I", 'P']
    @des = ["D", "E", "S"]
    @sub = ["S", "U", "B"]
    @pb = ["P", "B"]
    @ship_data = []
  end

  def print_board
    clear_screen!
    move_to_home!
    print_fleet_table  
    puts "     A   B   C   D   E   F   G   H   I   J  "
    puts "   +---------------------------------------+"
    for row in (0..9)
      print " #{row + 1}" if row < 9
      print "#{row + 1}" if row == 9
      print " | " 
      for col in (0..9)
        cell = @board[row][col]
        print cell 
        print " | " 
      end
      print "\n   +---------------------------------------+"
      print "\n" 
    end
  end

  def print_fleet_table
    # puts "Your Fleet                      "
    puts " ------------------------------------- "
    puts "|    | Ships in Fleet          | Size |"
    puts "| -- | ----------------------- | ---- |"
    puts "| 1x | Aircraft carrier(CRAFT) | 5    |"      
    puts "| 1x | Battleship(SHIP)        | 4    |"
    puts "| 1x | Submarine(SUB)          | 3    |"
    puts "| 1x | Destroyer(DES)          | 3    |"
    puts "| 1x | Patrol Boat(PB)         | 1    |"
    puts " ------------------------------------- "
  end

  def column(letter)
    letters_to_num = {"A" => 0, "B" => 1, "C" => 2, "D" => 3, "E" => 4, "F" => 5, "G" => 6, "H" => 7, "I" => 8, "J" => 9}
    return letters_to_num[letter]
  end


  def parse_letter(cord)
    /(\w)(\d)/.match(cord)
    return $1.to_s
  end

  def parse_number(cord)
    /(\w)(\d\d?)/.match(cord)
    return $2
  end

  def parse(cord)
    array_cord = []
    array_cord << parse_letter(cord)
    array_cord << parse_number(cord)
    return array_cord
  end

  def shoot(cord)
    letter = parse_letter(cord)
    number = parse_number(cord)
    # p "#{letter}: letter -- #{number}:number"
    # spot = @board[number.to_i - 1][column(letter)]
    # puts "This is the spot #{letter}#{number}: #{spot}"
    # @board[number.to_i - 1][column(letter)] = "/" if @board[number.to_i - 1][column(letter)] =~ /\./
    @board[number.to_i - 1][column(letter)] = "X" if @board[number.to_i - 1][column(letter)] != " "
    

    # @board[spot] = "/" if @board[spot] == "."
    # @board[spot] = "X" if @board[spot] != " "
    self.print_board
    # p @board[number.to_i - 1][column(letter)] =~ /\./
    # puts "Hello"
  end

  def place_ship
    # ship_data[0] == first_cord_raw, ship_data[1] == across
    # ship_data[2] == ship array (i.e.["C", "R", "A", "F", "T"])
    questions_for_ship_placement
    column_and_row = parse(@ship_data[0]) #breaks out cord
    lettered_column = column(column_and_row.first)
    numbered_row = column_and_row.last.to_i - 1
    if @ship_data[1]
      for i in (0..3)
        @board[numbered_row][lettered_column + i] = @ship_data[2][i]
      end
    elsif 
      for n in (0..3)
        @board[numbered_row + n][lettered_column] = @ship_data[2][n]
      end
    end
    self.print_board

  end


  def questions_for_ship_placement
    # ship_data[0] == first_cord, ship_data[1] == across
    # ship_data[2] == ship array (i.e.["C", "R", "A", "F", "T"])
    ship_hash = {
    1 => ["C", "R", "A", "F", "T"],
    2 => ["S", "H", "I", 'P'],
    4 => ["D", "E", "S"],
    3 => ["S", "U", "B"],
    5 => ["P", "B"]
    }
    clear_screen!
    move_to_home!
    self.print_board
    puts "Which ship would you like to add: "
    puts "Enter 1 for Aircraft carrier(CRAFT)"
    puts "Enter 2 for Battleship(SHIP)"
    puts "Enter 3 for Submarine(SUB)"
    puts "Enter 4 for Destroyer(DES)"
    puts "Enter 5 for Patrol Boat(PB)"
    ship_number = gets.chomp

    puts "Which coord should it start on?(i.e.'A1')"
    first_cord_raw = gets.chomp
    puts "Place across(a) or down(d)?"
    direction = gets.chomp
    if direction == "a"
      across = true
    else 
      across = false
    end
    
    # clear_screen!
    # move_to_home!

    # ship_data[0] == first_cord, ship_data[1] == across
    # ship_data[2] == ship array (i.e.["C", "R", "A", "F", "T"])
    @ship_data = [first_cord_raw, across, ship_hash[ship_number.to_i] ]
    return @ship_data
    # puts "Your ship looks like this: #{ship_hash[ship_number.to_i]}"
    # puts "You want it to start on coord: #{first_cord_raw}"
    # puts "You want the ship to go across? #{across}"
  end

  def begin_game

  end

end #end of class


# battleship_board = Array.new(10){Array.new(10){"0"}}

new_game = Battleship.new
new_game.print_board
new_game.begin_game
# new_game.shoot("G8")
# new_game.shoot("A8")
# new_game.shoot("B8")
# new_game.shoot("G10")
# new_game.place_aircraft_carrier("A2")
# new_game.place_aircraft_carrier("H2", false)
# new_game.place_battleship("D7", false)
# new_game.shoot("D7")
# new_game.shoot("G4")













