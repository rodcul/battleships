require 'board'
require 'byebug'

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

  it 'checks b2 in 3x3 grid' do
    board = Board.new 3
    expect{ board.check_board(:b2) }.to_not raise_error
  end

  it 'checks c4 in 3x3 grid' do
    board = Board.new 3
    expect{ board.check_board(:c4) }.to raise_error 'Outside board'
  end

  it 'checks multiple cells horizontal' do
    board = Board.new 3
    expect{ board.check_board(:a3,2) }.to raise_error 'Outside board'

  end

  it 'checks multiple cells vertical' do
    board = Board.new 3
    expect{ board.check_board(:c3,2,:vertical) }.to raise_error 'Outside board'

  end

  



end
