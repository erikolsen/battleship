require_relative 'screen_stuff'

class Battleship

  def initialize
    @board = Array.new(10){Array.new(10){"."}}
  end

  def look_inside
    bar = []
    for row in @board
      for col in row
        bar << col
      end
    end
    bar = bar.join()
    # p bar.strip
    # p (/C\s?R\s?A\s?F\s?T\s?/).match(bar)

    foo = @board.join
    p foo
    # p  !(/C\s?R\s?A\s?F\s?T\s?/).match(foo).nil?
    p  !(/CRAFT/).match(foo).nil?

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

  # def print_fleet_table
    
  #   # puts "Your Fleet                      "
  #   puts " ------------------------------ "
  #   puts "|          | Ships in Fleet   | Size |"
  #   puts "| -------- | ---------------- | ---- |"
  #   puts "| #{craft} | Aircraft carrier | 5    |"      
  #   puts "| #{ship}  | Battleship       | 4    |"
  #   puts "| #{sub}   | Submarine        | 3    |"
  #   puts "| #{des}   | Destroyer        | 3    |"
  #   puts "| #{pb}    | Patrol Boat      | 1    |"
  #   puts " ------------------------------ "
  # end

  #battleship 10*10

  def place_ship(first_cord, across = true)
    start = parse(first_cord)
    #test with A1 - E1 across
    # test down H2 to H6 down
    # last = parse(last_cord)
    # p "#{letter}: letter -- #{number}:number"
    if across
      for i in (0..4)
        @board[start.last.to_i - 1][column(start.first) + i] = craft[i]
      end
    elsif !across
      for n in (0..4)
        @board[(start.last.to_i - 1) + n][column(start.first)] = craft[n]
      end
    end
    self.print_board
  end

  def place_aircraft_carrier(first_cord, across = true)
    craft = ["C", "R", "A", "F", "T"]
    start = parse(first_cord)
    #test with A1 - E1 across
    # test down H2 to H6 down
    # last = parse(last_cord)
    # p "#{letter}: letter -- #{number}:number"
    if across
      for i in (0..4)
        @board[start.last.to_i - 1][column(start.first) + i] = craft[i]
      end
    elsif !across
      for n in (0..4)
        @board[(start.last.to_i - 1) + n][column(start.first)] = craft[n]
      end
    end
    self.print_board
  end

  def place_battleship(first_cord, across = true)
    ship = ["S", "H", "I", 'P']
    start = parse(first_cord)
    #test with A1 - E1 across
    # test down H2 to H6 down
    # last = parse(last_cord)
    # p "#{letter}: letter -- #{number}:number"
    if across
      for i in (0..3)
        @board[start.last.to_i - 1][column(start.first) + i] = ship[i]
      end
    elsif 
      for n in (0..3)
        @board[(start.last.to_i - 1) + n][column(start.first)] = ship[n]
      end
    end
    self.print_board
  end

  def place_destroyer(first_cord, across = true)
    3
    DES
  end

  def place_patrol_boat(first_cord, across = true)
    2
    PB
  end

  def place_submarine(first_cord, across = true)
    3
    SUB
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


end #end of class


# battleship_board = Array.new(10){Array.new(10){"0"}}

new_game = Battleship.new
new_game.print_board
# new_game.shoot("G8")
# new_game.shoot("A8")
# new_game.shoot("B8")
# new_game.shoot("G10")
# new_game.place_aircraft_carrier("A2")
# new_game.place_aircraft_carrier("H2", false)
# new_game.place_battleship("D7", false)
# new_game.shoot("D7")
# new_game.shoot("G4")













