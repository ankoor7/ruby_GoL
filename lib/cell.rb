
class Neighbourhood
  attr_accessor :grid_size
end

class Cell
  attr_accessor :coordinates, :state

  def initialize(a: 0, b: 0)
    @coordinates = {a: a, b: b}
    @state = 'alive'
  end

  def spawn_at(a: 0, b: 0)
    Cell.new(a: a, b: b)
  end
end

