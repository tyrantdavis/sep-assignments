class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :films
  attr_accessor :viewed

  def initialize
    @name = name
    @films = []
    @viewed = false
  end
end
