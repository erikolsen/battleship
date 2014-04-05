# string = '619030040270061008000047621486302079000014580031009060005720806320106057160400030'

# Takes board as an array of arrays. Output is a series of strings.
def print_board(board)  
  puts "+- - - - - - - - - - - - - - - -+"
  for row in (0..8)
    print "| " 
    for col in (0..8)
      cell = board[row][col]
      print cell
      print " |" if col == 2 || col == 5 || col == 8
      print "  " if col != 2 || col != 5 
    end
    print "\n+- - - - - - - - - - - - - - - -+" if row == 2 || row == 5 || row == 8
    print "\n" 
  end
  # puts "Solved" if solved? 
end

# board_string = string.split('')
# array = Array.new(9){board_string.shift(9)}

# array.each {|x| p x}
# print_board(array)


