class Ship

  attr_reader :size

  TYPES = {
    aircraftcarrier: 5,
    battleship: 4,
    cruiser: 3,
    destroyer: 2,
    submarine: 1
  }

  def initialize (type)
    @size = TYPES[type]
  end
end