require 'board'
require 'ship'

feature 'Battleships game' do

  # scenario 'allows placing a ship on the board' do
  #   board = Board.new
  #   submarine = Ship.new(:submarine)
  #   board.place_ship(submarine, 'B2')
  #   expect(board.grid('B2')).to eq submarine
  # end

  scenario 'allows placing of a submarine(size 1)' do
    submarine = Ship.new(:submarine)
    board = Board.new
    board.place_ship(submarine, 'B2')
    expect(board.grid_retrieve('B2')).to eq submarine
  end

  scenario 'allows placing of a cruiser(size 1)' do
    cruiser = Ship.new(:cruiser)
    board = Board.new
    board.place_ship(cruiser, 'B2')
    expect(board.grid_retrieve('B2')).to eq cruiser
    expect(board.grid_retrieve('B4')).to eq cruiser
  end
end