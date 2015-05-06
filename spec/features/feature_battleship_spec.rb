require 'board'

feature Board do

    scenario 'gets created with custom size' do
      random_size = Random.rand(1..10)
      board = Board.new(random_size)
      expect(board.size).to eq random_size
    end

    scenario 'allows placing ship in a coordinates' do

      board = Board.new
      ship = Ship.new(:destroyer)
      board.place_ship(:a3, ship, :vertical)
      expect(board.lookup(:a3)).to eq ship
      expect(board.lookup(:a3)).to eq ship

    end

    scenario 'disallows placing ship outside of board' do
      board = Board.new 3
      ship = Ship.new :destroyer
      expect{ board.place_ship(:d4, ship, :horizontal) }.to raise_error 'Outside board'
    end

    scenario 'disallows placing ship that extends outside of board' do
      board = Board.new 3
      ship = Ship.new :cruiser
      expect{ board.place_ship(:c3,ship,:horizontal) }.to raise_error 'Outside board'
      expect( board.lookup(:c3)).to be nil
    end

    xscenario 'disallows placing ship on top of another' do
      board = Board.new 3
      destroyer = Ship.new :destroyer
      cruiser = Ship.new :cruiser
      board.place_ship(:a1, cruiser, :vertical)
      expect{ board.place_ship(:c1, destroyer, :horizontal) }.to raise_error 'Overlap'
      expect( board.lookup(:c2)).to be nil
    end



end
