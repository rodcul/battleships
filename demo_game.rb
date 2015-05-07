require_relative './lib/board'

board = Board.new 5
destroyer = Ship.new :destroyer
cruiser = Ship.new :cruiser
aircraftcarrier = Ship.new :aircraftcarrier

board.place_ship(:a2, cruiser, :vertical)
board.place_ship(:e2, destroyer, :horizontal)
board.place_ship(:a5, aircraftcarrier, :vertical)

board.fire :b2
board.fire :c2
board.fire :e1
board.fire :e2
board.fire :e3


puts "\n"
board.print
puts "\n"
p cruiser
p destroyer
p aircraftcarrier
puts "\n\n"
