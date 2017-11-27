class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :films_array
  attr_accessor :tested

  def initialize(name)
    @name = name
    @films_array = []
    @tested = false
  end

  def films_and_actors(films)
    @film_actor_hash = Hash.new
    films.each do |key, value|
      value.each do |node|
        if node.name == name
          @film_actor_hash[key] = value
          @film_actor_hash[key] -= [node]
        end
      end
    end
  end
end
