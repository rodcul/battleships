class Ship

  attr_reader :type, :size

  TYPES = {
    aircraftcarrier: 5,
    battleship: 4,
    cruiser: 3,
    destroyer: 2,
    submarine: 1
  }

  def initialize type
    @type = type
    @size = TYPES[:destroyer]
  end


end

ship = Ship.new :destroyer

puts ship.inspect
