require_relative 'node'

class Graph
  def find_kevin_bacon(beginning)
    queue = []
    found = false
    queue << beginning
    while !queue.size.eql?(0)
      node = queue.shift
      node.film_actor_hash.each do |movie, actor_nodes|
        if !beginning.films_array.include?(movie)
          beginning.films_array << (movie)
        end
        actor_nodes.each do |actor|
          if actor.name != "Kevin Bacon" && actor.tested == false
            queue <<  actor
            actor.tested = true
          end
          #  Kevin Bacon found?
          if actor.name == "Kevin Bacon"
            found = true
            # reset all nodes to untested

            return beginning.films_array
          end
        end
      end
    end
    return "No connection to Kevin Bacon"
  end

  def restart(hash)
    hash.each do |movie, actor_nodes|
      actor_nodes.each do |actor|
        actor.tested = false
      end
    end
  end
end
