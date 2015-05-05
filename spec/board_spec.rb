require 'board'

describe Board do
  it 'should be created with default size of 10' do
    board = Board.new
    expect(board.places.count).to eq 10
  end


  it 'should lookup a3 and return [0,2]' do
    board = Board.new
    expect(board.mapper('a3')).to eq [0,2]
  end

end