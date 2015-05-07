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

  it 'should log hits' do
    ship = Ship.new(:cruiser)
    ship.hit
    expect(ship.hits).to eq 1
  end

  it 'cruiser not sunk after 2 hits' do
    ship = Ship.new(:cruiser)
    2.times { ship.hit }
    expect(ship.sunk).to be false
  end

  it 'cruiser sunk after 3 hits' do
    ship = Ship.new(:cruiser)
    3.times { ship.hit }
    expect(ship.sunk).to be true
  end
end
