class Board

  attr_accessor :places

def initialize(size = 10)
  @places = Array.new(size) {|array| Array.new(size)}
end

def convert_to_array location
  alphabet = ('a'..'z').to_a
  x, y = location.chars
  @array = alphabet.index(x) , y.to_i-1

end

def place_ship location
  x,y = convert_to_array location
  @places[x][y] = false
end

end

board = Board.new 3

board.place_ship "a1"
board.place_ship "a2"
board.place_ship "c2"
puts board.places.inspect
