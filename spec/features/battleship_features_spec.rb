require 'board'

feature 'Battleships game' do

  scenario 'allows placing a ship on the board' do
    board = Board.new
    board.place_ship(:s)
    expect(board.grid[0]).to eq :s
  end
end