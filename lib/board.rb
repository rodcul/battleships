require_relative 'ship'

class Board

  attr_accessor :places

def initialize(size = 10)
  @places = Array.new(size) {|array| Array.new(size)}
end

def mapper(location)
  alphabet = ('a'..'z').to_a
  x, y = location.chars
  @array = alphabet.index(x) , y.to_i-1
end

def check_on_board (x,y)
  grid = self.places.count
  fail 'Outside board' if x > grid ||  y > grid || x < 0 || y < 0
  true
end

def place_ship(location,input_ship,direction)

  ship = Ship.new
  size = ship.ships[input_ship]
  x, y = mapper location

  check_on_board(x,y)
  direction == 'vertical' ? check_on_board(x+size,y) : check_on_board(x,y+size)


  if direction == 'horizontal'
    i = 0
    while i < size
      places[x][y+i] = 's'
      i += 1
    end
  else direction == 'vertical'
    i = 0
    while i < size
      places[x+i][y] = 's'
      i += 1
    end

  end

end

def lookup location
  x,y = mapper location
  places[x][y]
end


def print
  places.each do |r|
  puts r.map { |p| p ? p : '·' }.join(" ")
end
end
end
