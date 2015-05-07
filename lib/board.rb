require_relative 'ship'

class Board
  def initialize(size = 10)
    @grid = Array.new(size) {|array| Array.new(size)}
    @ships = []
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
    @grid.each do |row|
      puts row.map { |cell| cell ? (cell.class == Ship ? 'S' : cell) : '·' }.join(" ")
    end
  end

  def game_over?
    Ship.all_offspring.select {|ship| ship.sunk == false}.empty?
  end
end
