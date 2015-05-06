class Ship

  attr_reader :type, :size, :hits

  TYPES = {
    aircraftcarrier: 5,
    battleship: 4,
    cruiser: 3,
    destroyer: 2,
    submarine: 1
  }

  def initialize type
    @type = type
    @size = TYPES[type]
    @hits = 0
  end

  def hit
    @hits +=1
  end


end
