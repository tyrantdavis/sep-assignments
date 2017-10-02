class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :films
  attr_accessor :viewed

  def initialize
    @name = name
    @film_actor_hash = film_actor_hash
    @films = []
    @viewed = viewed
  end
end
