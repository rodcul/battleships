require_relative 'ship'

class Board

  attr_accessor :places

def initialize(size = 10)
  @places = Array.new(size) {|array| Array.new(size)}
end

def mapper location
  alphabet = ('a'..'z').to_a
  x, y = location.chars
  @array = alphabet.index(x) , y.to_i-1


end

def place_ship location
  x,y = mapper location
  places[x][y] = 'ship'
end

def lookup location
  x,y = mapper location
  places[x][y]
end



def ship?
  true
end
end
