require 'board'

feature Board do

    scenario 'gets created with custom size' do
      random_size = Random.rand(1..10)
      board = Board.new random_size
      expect(board.places.count).to eq random_size
    end

    scenario 'allows placing ship in a location' do

      board = Board.new
      board.place_ship('a3',:destroyer)
      expect(board.lookup('a3')).to eq 's'
      expect(board.lookup('a4')).to eq 's'

    end



end
