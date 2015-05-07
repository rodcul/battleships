require 'board'

feature Board do

    scenario 'gets created with custom size' do
      random_size = Random.rand(1..10)
      board = Board.new(random_size)
      expect(board.size).to eq random_size
    end

    scenario 'allows placing ship in a coordinates' do

      board = Board.new 3
      ship = Ship.new(:cruiser)
      board.place_ship(:a3, ship, :vertical)
      expect(board.lookup(:a3)).to eq ship
      expect(board.lookup(:c3)).to eq ship

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

    xscenario 'disallows placing overlapping ships' do
      board = Board.new 3
      cruiser1 = Ship.new :cruiser
      cruiser2 = Ship.new :cruiser
      board.place_ship(:b1,cruiser1,:horizontal)
      expect{ board.place_ship(:a3,cruiser2,:vertical) }.to raise_error 'Overlaps'
      expect( board.lookup(:c3)).to be nil

    end



    xscenario 'lets me know when I\'ve won' do
      board = Board.new 5
      destroyer = Ship.new :destroyer
      cruiser = Ship.new :cruiser
      board.place_ship(:a1, cruiser, :vertical)
      board.place_ship(:d2, destroyer, :horizontal)
      board.fire :a1
      board.fire :b1
      board.fire :c1
      board.fire :d2
      board.fire :d3
      byebug
      expect(board).to be_game_over

    end



end
