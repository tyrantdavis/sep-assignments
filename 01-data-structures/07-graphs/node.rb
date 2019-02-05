class Node
  attr_accessor :name
  attr_accessor :films_array
  attr_accessor :tested

  def initialize(name)
    @name = name
    @films_ary = Array.new
    @tested = false
  end

  # add actor's to film array
  def add_actor_to_film(film)
    film.cast << self
    @films_ary << film
  end

  # Returns a list actors in film with the current actor. Excludes current actor from list
  def film_actor_hash(film)
    if film.cast.include?(self)
      film.cast.each do | actor |
        if !actor.eql?(self)
          puts actor.name
        end
      end
    else
      return "#{actor} not apart of the cast for that movie. Please try again."
    end
  end

  def find_kevin_bacon(films = [], actor = self)
      actor.films_ary.each do |film|
        if !films.include?(film.name)
          films.push(film.name)
        end
        if film.cast.include?(Kevin)
          puts films
        else
          actor.tested = true
          film.cast.each do | curr_actor |
            if curr_actor.tested.eql?(false)
              curr_actor.find_kevin_bacon(films, actor = curr_actor)
            end
          end
        end
      end
  end

end
