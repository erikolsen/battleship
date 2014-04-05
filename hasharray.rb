string = '619030040270061008000047621486302079000014580031009060005720806320106057160400030'



# chess = Array.new(9){Array.new(9){'-'}}
# chess.each {|x| p x}

# array = string.split('').each_slice(9)

# array.map{|x| p x.map{|y| y.to_i}}
# Use "reputs" to print over a previously printed line,
# assuming the cursor is positioned appropriately.
def reputs(str = '')
  puts "\e[0K" + str
end

# Clear the screen
def clear_screen!
  print "\e[2J"
end

# Moves cursor to the top left of the terminal
def move_to_home!
  print "\e[H"
end

# Flushes the STDOUT buffer.
# By default STDOUT is only flushed when it encounters a newline (\n) character
def flush!
  $stdout.flush
end


def print_counter(counter)
  clear_screen!
  move_to_home!
  reputs counter.to_s
  sleep(1)
end


for counter in (1..15)
  print_counter(counter)
end
