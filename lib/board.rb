require_relative 'ship'

class Board

  def places
    @places = places
    @places
  end

  def initialize
    @places = {
"a1"=>" ","a2"=>" ","a3"=>" ",
"b1"=>" ","b2"=>" ","b3"=>" ",
"c1"=>" ","c2"=>" ","c3"=>" "
}
  end

  def place(ship)

  end

  def ship?
    true
  end
end
