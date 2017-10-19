require_relative 'city'

def distance_calc(city1, city2)
  return Math.sqrt( (city2.x - city1.x)**2 + (city2.y - city1.y)**2 )
end
# DEF nearest possible neighbor(graph_of_cities, current_city)
def nearest_possible_neighbor(graph_of_cities, current_city)
  path = [current_city.name]

  while !graph_of_cities[0].nil?
    next_town = graph_of_cities[0]

    graph_of_cities.each do |option|
     distance_calc(current_city, next_town) > distance_calc(current_city, option)
        next_town = option
    end
    current_city = next_town
    graph_of_cities.delete(next_town)
    path << current_city.name
  end
  path
end

home = City.new("irvine", 0, 0)
city2 = City.new("boise", 1, 9)
city3 = City.new("seattle", 0, 9)
city4 = City.new("london", 22, 10)
city5 = City.new("new york", 10, 10)
city6 = City.new("budapest", 25, 8)
city7 = City.new("atlanta", 10, 0)

city_graph = [city2, city4, city3, city7, city6, city5]
p "city2: #{city2}"
trip_path = nearest_possible_neighbor(city_graph, home)
puts trip_path
