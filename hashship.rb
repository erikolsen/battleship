require_relative 'screen_stuff'
ENEMY_BOARD = [[".", "S", ".", ".", ".", ".", ".", ".", ".", "."], [".", "H", ".", ".", ".", ".", ".", "D", ".", "."], [".", "I", ".", ".", ".", ".", ".", "E", ".", "."], [".", "P", ".", ".", ".", ".", ".", "S", ".", "."], [".", ".", ".", ".", "S", ".", ".", ".", ".", "."], [".", ".", ".", ".", "U", ".", ".", ".", ".", "."], [".", ".", ".", ".", "B", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", ".", ".", "."], ["C", "R", "A", "F", "T", ".", ".", ".", "P", "B"]]


class Battleship

  def initialize
    @board = Array.new(10){Array.new(10){"."}}
    @craft = ["C", "R", "A", "F", "T"]
    @ship = ["S", "H", "I", 'P']
    @des = ["D", "E", "S"]
    @sub = ["S", "U", "B"]
    @pb = ["P", "B"]
    @ship_data = []
    @date = Time.now
    @time = 100
  end

  def print_enemy_board
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
        cell = ENEMY_BOARD[row][col]
        print cell 
        print " | " 
      end
      print "\n   +---------------------------------------+"
      print "\n" 
    end
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
    puts "              Ruby Battleship           "
    puts "        _______________________________ "
    puts "       |Ships                   | Size |"
    puts "       |----------------------- | ---- |"
    puts "       |Aircraft carrier(CRAFT) | 5    |"      
    puts "       |Battleship(SHIP)        | 4    |"
    puts "       |Submarine(SUB)          | 3    |"
    puts "       |Destroyer(DES)          | 3    |"
    puts "       |Patrol Boat(PB)         | 2    |"
    puts "        ------------------------------- "
  end      

  # def print_fleet_table
  #   # puts "Your Fleet                      "
  #   puts " ------------------------------------- "
  #   puts "|#{@time}| Ships in Fleet          | Size |"
  #   puts "| --     | ----------------------- | ---- |"
  #   puts "| 1x | Aircraft carrier(CRAFT) | 5    |"      
  #   puts "| 1x | Battleship(SHIP)        | 4    |"
  #   puts "| 1x | Submarine(SUB)          | 3    |"
  #   puts "| 1x | Destroyer(DES)          | 3    |"
  #   puts "| 1x | Patrol Boat(PB)         | 1    |"
  #   puts " ------------------------------------- "
  # end

  def column(letter)
    letters_to_num = {"A" => 0, "B" => 1, "C" => 2, "D" => 3, "E" => 4, "F" => 5, "G" => 6, "H" => 7, "I" => 8, "J" => 9}
    return letters_to_num[letter]
  end


  def parse_letter(cord)
    /(\w)(\d)/.match(cord)
    return $1.to_s.upcase
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

  def shoot(cord, board = @board)
    letter = parse_letter(cord)
    number = parse_number(cord)
    @hit = false
    @number_of_hits = []
    # targeted_area = board[number.to_i - 1][column(letter)]
    # p "#{letter}: letter -- #{number}:number"
    # spot = @board[number.to_i - 1][column(letter)]
    # puts "This is the spot #{letter}#{number}: #{spot}"
    board[number.to_i - 1][column(letter)] = "0" if board[number.to_i - 1][column(letter)] =~ /\./ 
    board[number.to_i - 1][column(letter)] = "X" if board[number.to_i - 1][column(letter)] =~ /[A-Z]/
    @hit = true if board[number.to_i - 1][column(letter)] == "X"
    @number_of_hits << "X" if @hit
    # @board[spot] = "/" if @board[spot] == "."
    # @board[spot] = "X" if @board[spot] != " "
    self.print_board if board == @board
    self.print_enemy_board if board == ENEMY_BOARD
    # p @board[number.to_i - 1][column(letter)] =~ /\./
    # puts "Hello"
  end

  def place_ship(ship_data)
    # ship_data[0] == first_cord_raw, ship_data[1] == across
    # ship_data[2] == ship array (i.e.["C", "R", "A", "F", "T"])
    column_and_row = parse(@ship_data[0]) #breaks out cord
    lettered_column = column(column_and_row.first)
    numbered_row = column_and_row.last.to_i - 1
    if @ship_data[1]
      for i in (0..@ship_data[2].length-1)
        @board[numbered_row][lettered_column + i] = @ship_data[2][i]
      end
    elsif 
      for n in (0..@ship_data[2].length-1)
        @board[numbered_row + n][lettered_column] = @ship_data[2][n]
      end
    end
    # self.print_board

  end


  def questions_for_ship_placement
    puts "----------------------test"
    # ship_data[0] == first_cord, ship_data[1] == across
    # ship_data[2] == ship array (i.e.["C", "R", "A", "F", "T"])
    ship_hash = {
    'Aircraft carrier(CRAFT)' => ["C", "R", "A", "F", "T"],
    'Battleship(SHIP)'=> ["S", "H", "I", 'P'],
    'Destroyer(DES)' => ["D", "E", "S"],
    'Submarine(SUB)' => ["S", "U", "B"],
    'Patrol Boat(PB)' => ["P", "B"]
    }
    # puts "Which ship would you like to add: "
    # puts "Enter 1 for Aircraft carrier(CRAFT)"
    # puts "Enter 2 for Battleship(SHIP)"
    # puts "Enter 3 for Submarine(SUB)"
    # puts "Enter 4 for Destroyer(DES)"
    # puts "Enter 5 for Patrol Boat(PB)"
    # ship_number = gets.chomp
    ship_hash.each do |key, value|
      clear_screen!
      move_to_home!
      self.print_board
      puts "Where would you like you place your #{key}?"
      print "Enter starting coords(i.e.'A1'): "
      first_cord_raw = gets.chomp
      print "Place across(a) or down(d)? "
      direction = gets.chomp
      if direction == "a"
        across = true
      else 
        across = false
      end
      # ship_data[0] == first_cord, ship_data[1] == across
      # ship_data[2] == ship array (i.e.["C", "R", "A", "F", "T"])
      @ship_data = [first_cord_raw, across, value ]
      place_ship(@ship_data)
    end #end hash loop
      # puts "Your ship looks like this: #{ship_hash[ship_number.to_i]}"
      # puts "You want it to start on coord: #{first_cord_raw}"
      # puts "You want the ship to go across? #{across}"
    self.print_board
    # p @board
  end #method ends

  def fire_when_ready
    keep_firing = true
    puts "Keep firing until all ships are destoyed!"
    while keep_firing
    	break if @number_of_hits.length == 16
      puts "Fire a salvo?" unless @hit
      puts "You scored a hit! Fire again?" if @hit
      print "If yes enter coords, if no enter, 'n': "
      input = gets.chomp
      break if input == 'n' 
      shoot(input, @board) if input != 'n'
    end
    print "You win!" if @number_of_hits.lenth == 16
    puts "Game over man, game over!"

  end

  def timer 
    while @time > 0
      @time -= 1
      sleep(0.5)
    end
  end

  def begin_game
    self.questions_for_ship_placement
    self.fire_when_ready
  end

  def check_rows
  	ships_here = []
  	ENEMY_BOARD.each do |row|
  		row.each do |element|
  			ships_here << element if element =~ /[A-Z]/
  		end
  	end
  	foo = ships_here.join('')
  	p foo
  	p true if foo.match(/CRAFT/)

  end


end #end of class


# battleship_board = Array.new(10){Array.new(10){"0"}}

new_game = Battleship.new
new_game.print_enemy_board
new_game.check_rows



















