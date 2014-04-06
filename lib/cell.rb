
class Neighbourhood
  attr_accessor :resident, :population

  def initialize(resident:)
    @resident = resident
    @population = []
  end
end

class Cell
  attr_accessor :state

  def initialize(state: 'alive')
    @state = state
  end

  def spawn(state: 'alive')
    Cell.new(state: state)
  end
end

module VectorUtilities
  require "matrix"
  def distance(cell, neighbour)
    origin = cell[:coordinates]
    destination = neighbour[:coordinates]

    vector = Vector.elements(destination) - Vector.elements(origin)

    return Vector.elements(vector).r
  end
end


class World
  include VectorUtilities
  attr_accessor :cells, :neighbourhoods

  def initialize(x:, y:)
    @x, @y = x, y
    @neighbourhoods =  []
    @cells  = []
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
      neighbourhood = Neighbourhood.new resident: cell

      others = cells.reject { |item|
        item[:coordinates] == cell[:coordinates]
      }

      others.each do |neighbour|
        separation = distance(cell, neighbour)
        if separation < 1.8 && separation >= 1
          neighbourhood.population << neighbour
        end
      end
      @neighbourhoods << neighbourhood
    end
  end
end


