require 'ship'

describe Ship do
  it 'should get created with type :destroyer' do
    ship = Ship.new(:destroyer)
    expect(ship.type).to eq :destroyer
  end

  it 'should get created with size 2' do
    ship = Ship.new(:destroyer)
    expect(ship.size).to eq 2
  end

end
