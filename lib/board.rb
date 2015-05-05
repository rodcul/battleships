require_relative 'ship'

class Board

  attr_accessor :grid

def initialize(size = 10)
  @grid = Array.new(size) {|array| Array.new(size)}
end

def mapper(location)
  alphabet = ('a'..'z').to_a
  row,col  = location.chars
  @array = alphabet.index(row) , col.to_i-1
end

def check_on_board (row,col)
  size = self.grid.count
  fail 'Outside board' if (row||col) > size
  true
end

def place_ship(location,input_ship,direction)

  ship = Ship.new
  size = ship.ships[input_ship]
  row, col = mapper location

  check_on_board(row,col)
  direction == 'vertical' ? check_on_board(row+size,col) : check_on_board(row,col+size)


  if direction == 'horizontal'
    i = 0
    while i < size
      grid[row][col+i] = 's'
      i += 1
    end
  else direction == 'vertical'
    i = 0
    while i < size
      grid[row+i][col] = 's'
      i += 1
    end

  end

end

def lookup location
  row,col = mapper location
  grid[row][col]
end


def print
  grid.each do |r|
  puts r.map { |p| p ? p : '·' }.join(" ")
end
end
end
