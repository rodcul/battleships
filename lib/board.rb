require_relative 'ship'

class Board
  def initialize(size = 10)
    @grid = Array.new(size) {|array| Array.new(size)}
  end

  def mapper(coordinates)
    alphabet = ('a'..'z').to_a
    row,col  = coordinates.to_s.split(//,2)
    @array = alphabet.index(row) , col.to_i-1
  end

  def check_on_board (row, col)
    size = self.size
    fail 'Outside board' if col > size || row > size
    true
  end

  def place_ship(coordinates,ship,direction)
    size = ship.size
    row, col = mapper coordinates

    check_on_board(row,col)
    direction == :vertical ? check_on_board(row+size,col) : check_on_board(row,col+size)


      if direction == :horizontal
        i = 0
        while i < size
          @grid[row][col+i] = ship
          i += 1
        end
      else direction == :vertical
        i = 0
        while i < size
          @grid[row+i][col] = ship
          i += 1
          end
        end
    end

  def lookup(coordinates)
    row,col = mapper(coordinates)
    @grid[row][col]
  end

  def fire(coordinates)
    row,col = mapper(coordinates)
    if @grid[row][col].nil?
      @grid[row][col] = 'M'

    else
      @grid[row][col].hit
      @grid[row][col] = '*'
    end

  end

  def size
    @grid.count
  end

  def print
    @grid.each do |r|
      puts r.map { |p| p ? (p.class == Ship ? 'S' : p) : '·' }.join(" ")
    end
  end
end

board = Board.new 5
cruiser = Ship.new :cruiser
board.place_ship(:a1,cruiser,:horizontal)
battleship = Ship.new :battleship
board.place_ship(:b5,battleship,:vertical)
board.fire :a1
board.fire :a2
board.fire :a3
board.fire :b1
board.fire :a4

board.print
puts cruiser.inspect
puts battleship.inspect
