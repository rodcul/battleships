require 'ship'

describe Ship do

  it 'creates submarine succesfully' do
    submarine = Ship.new :submarine
    expect(submarine.size).to eq 1
  end

  it 'creates cruiser succesfully' do
    cruiser = Ship.new :cruiser
    expect(cruiser.size).to eq 3
  end
end