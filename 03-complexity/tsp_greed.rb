require_relative 'city'

def distance_calc(city1, city2)
  return Math.sqrt( (city2.x - city1.x)**2 + (city2.y - city1.y)**2 )
end

def nearest_possible_neighbor(graph_of_cities, current_city)
  path = [current_city.name]
  while !graph_of_cities[0].nil?
    next_city = graph_of_cities[0]
    graph_of_cities.each do |i|
      if distance_calc(current_city, next_city) > distance_calc(current_city, i)
        next_city = i
      end
    end
    current_city = next_city
    graph_of_cities.delete(next_city)
    path.push(current_city.name)
  end
  path
end
home = City.new("orlando", 0, 0)
city2 = City.new("atlanta", 1, 10)
city3 = City.new("jacksonville", 0, 10)
city4 = City.new("paris", 22, 11)
city5 = City.new("new york", 10, 10)
city6 = City.new("Morocco", 24, 56)
city7 = City.new("Charlotte", 9, 11)

city_graph = [city2, city4, city3, city7, city6, city5]
p "city2: #{city2}"
trip_path = nearest_possible_neighbor(city_graph, home)
puts trip_path
