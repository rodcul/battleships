class Ship

  @@instance_collector = []

  attr_reader :type, :size, :hits, :sunk

  TYPES = {
    aircraftcarrier: 5,
    battleship: 4,
    cruiser: 3,
    destroyer: 2,
    submarine: 1
  }

  def initialize type
    @@instance_collector << self
    @type = type
    @size = TYPES[type]
    @hits = 0
    @sunk = false
  end

  def hit
    @hits += 1
    @sunk = true if self.size == @hits
  end

  def self.all_offspring
    @@instance_collector
  end

end
