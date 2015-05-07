require 'byebug'

class Board

  attr_reader :grid

  def grid_retrieve(coordinates)
    row, col = coordinates.split(//,2)
    @grid[[row,col.to_i]]
  end

  def initialize
    @grid = {
           ['A', 1] => nil, ['A', 2] => nil, ['A', 3] => nil, ['A', 4] => nil, ['A', 5] => nil, ['A', 6] => nil, ['A', 7] => nil, ['A', 8] => nil, ['A', 9] => nil, ['A', 10] => nil,
            ['B', 1] => nil, ['B', 2] => nil, ['B', 3] => nil, ['B', 4] => nil, ['B', 5] => nil, ['B', 6] => nil, ['B', 7] => nil, ['B', 8] => nil, ['B', 9] => nil, ['B', 10] => nil,
            ['C', 1] => nil, ['C', 2] => nil, ['C', 3] => nil, ['C', 4] => nil, ['C', 5] => nil, ['C', 6] => nil, ['C', 7] => nil, ['C', 8] => nil, ['C', 9] => nil, ['C', 10] => nil,
            ['D', 1] => nil, ['D', 2] => nil, ['D', 3] => nil, ['D', 4] => nil, ['D', 5] => nil, ['D', 6] => nil, ['D', 7] => nil, ['D', 8] => nil, ['D', 9] => nil, ['D', 10] => nil,
            ['E', 1] => nil, ['E', 2] => nil, ['E', 3] => nil, ['E', 4] => nil, ['E', 5] => nil, ['E', 6] => nil, ['E', 7] => nil, ['E', 8] => nil, ['E', 9] => nil, ['E', 10] => nil,
            ['F', 1] => nil, ['F', 2] => nil, ['F', 3] => nil, ['F', 4] => nil, ['F', 5] => nil, ['F', 6] => nil, ['F', 7] => nil, ['F', 8] => nil, ['F', 9] => nil, ['F', 10] => nil,
            ['G', 1] => nil, ['G', 2] => nil, ['G', 3] => nil, ['G', 4] => nil, ['G', 5] => nil, ['G', 6] => nil, ['G', 7] => nil, ['G', 8] => nil, ['G', 9] => nil, ['G', 10] => nil,
            ['H', 1] => nil, ['H', 2] => nil, ['H', 3] => nil, ['H', 4] => nil, ['H', 5] => nil, ['H', 6] => nil, ['H', 7] => nil, ['H', 8] => nil, ['H', 9] => nil, ['H', 10] => nil,
            ['I', 1] => nil, ['I', 2] => nil, ['I', 3] => nil, ['I', 4] => nil, ['I', 5] => nil, ['I', 6] => nil, ['I', 7] => nil, ['I', 8] => nil, ['I', 9] => nil, ['I', 10] => nil,
            ['J', 1] => nil, ['J', 2] => nil, ['J', 3] => nil, ['J', 4] => nil, ['J', 5] => nil, ['J', 6] => nil, ['J', 7] => nil, ['J', 8] => nil, ['J', 9] => nil, ['J', 10] => nil,
             }
  end

  def place_ship(ship, coordinates)
    row, col = coordinates.split(//,2)
    @grid[[row,col.to_i]] = ship
    i = 0
    while i <= ship.size
      coordinate = [row, col.to_i + i]
      @grid[coordinate] = ship
      i += 1
    end
  end

  def size
    @grid.count
  end

  def grid_read
    ('A'..'J').to_a.map do |letter|
      @grid.select do |k, v|
          k[0] == letter
      end.map {|k, v|  p v}
    end
  end
end

board = Board.new
board.grid_read