
class Neighbourhood
  attr_accessor :resident, :population

  def initialize(resident: , population: )
    @resident = resident
    @population = population
  end
end

class Cell
  attr_accessor :state

  def initialize(state: 'alive')
    @state = state
  end

  def spawn
    Cell.new(state: 'alive')
  end
end

class World
  attr_accessor :cells, :neighbourhoods

  def initialize(x:, y:)
    @x, @y = x, y
    populate
    stitch_neighbourhoods @cells
  end

  def populate
    @cells ||= []
    @x.times do |x|
      @y.times do |y|
        cell = Cell.new
        coordinates = [x, y]
        @cells << { cell: cell, coordinates: coordinates }
      end
    end
  end

  def stitch_neighbourhoods(cells)
    cells.each do |cell|

    end
  end
end
