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

def place_ship(location,input_ship)
  ship = Ship.new
  size = ship.ships[input_ship]
  x,y = mapper location

  i = 0
  while i < size
    places[x][y+i] = 's'
    i += 1
  end

end

def lookup location
  x,y = mapper location
  places[x][y]
end


end