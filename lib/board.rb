require_relative 'ship'
require 'byebug'

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

  def check_board(coordinates,spaces = 1, orientation = :horizontal)
    row,col = mapper(coordinates)
    i = col

    if orientation == :horizontal
      while i <= col + spaces
      fail 'Outside board' if col >= (self.size) - 1
      i += 1
      end

    else orientation == :vertical
      while i <= row + spaces
      fail 'Outside board' if row >= (self.size) - 1
      i += 1
      end
    end

  end

  def place_ship(coordinates,ship,orientation = :horizontal)

    check_board(coordinates,ship.size,orientation)
    row, col = mapper(coordinates)

      if orientation == :horizontal
        i = 0
        while i < ship.size
          @grid[row][col+i] = ship
          i += 1
        end
      else orientation == :vertical
        i = 0
        while i < ship.size
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
end
