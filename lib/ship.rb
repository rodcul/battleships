class Ship

  attr_accessor :ships

  def initialize
    @ships = {
      aircraftcarrier: 5,
      battleship: 4,
      cruiser: 3,
      destroyer: 2,
      submarine: 1
    }
  end

end
