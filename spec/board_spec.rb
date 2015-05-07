require 'board'

describe Board do
  it 'is created with default size of 10' do
    board = Board.new
    expect(board.size).to eq 10
  end


  it 'looks up a3 and return [0,2]' do
    board = Board.new
    expect(board.mapper('a3')).to eq [0,2]
  end

  it 'logs MISS when firing on empty space' do
    board = Board.new
    board.fire :a1
    expect(board.lookup(:a1)).to eq 'M'
  end


  it 'logs HIT when firing on ship' do
    board = Board.new
    ship = double :ship
    allow(ship).to receive(:size) { 3 }
    allow(ship).to receive(:hit) { 1 }
    allow(ship).to receive(:sunk) { false }
    board.place_ship(:a1,ship,:horizontal)
    board.fire :a1
    expect(board.lookup(:a1)).to eq '*'
  end

end
