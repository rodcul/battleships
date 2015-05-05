require 'board'

feature Board do

    scenario 'gets created with locations' do

      board = Board.new
      expect(board).to 

    end

    scenario 'allows placing ship in a location' do

      board = Board.new
      ship = Ship.new
      board.place ship
      expect(board).to be_ship

    end

end
