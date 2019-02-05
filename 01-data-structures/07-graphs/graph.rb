require_relative 'node'
class Graph
  attr_accessor :name, :cast

  def initialize(name)
    @name = name
    @cast = []
  end
end
