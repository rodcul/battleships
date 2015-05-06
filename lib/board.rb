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

  def check_on_board (row,col)
    size = @grid.count
    fail 'Outside board' if (row||col) > size
    true
  end

  def place_ship(coordinates,ship,direction)

    ship = Ship.new ship
    size = ship.size
    row, col = mapper coordinates

    check_on_board(row,col)
    direction == :vertical ? check_on_board(row+size,col) : check_on_board(row,col+size)


      if direction == :horizontal
        i = 0
        while i < size
          @grid[row][col+i] = :s
          i += 1
        end
      else direction == :vertical
        i = 0
        while i < size
          @grid[row+i][col] = :s
          i += 1
          end
        end
    end

  def lookup(coordinates)
    row,col = mapper(coordinates)
    @grid[row][col]
  end

  def size
    @grid.count
  end

  def print
    grid.each do |r|
      puts r.map { |p| p ? p : '·' }.join(" ")
    end
  end
end
