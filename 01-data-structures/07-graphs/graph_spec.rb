require_relative "graph"
require_relative "node"


Kevin = Node.new("Kenin Bacon")
Eddie = Node.new("Eddie Murphy")
Jenn = Node.new("Jennifer Laurence")
James = Node.new("James McAvoy")
John = Node.new("John Lithgow")
Laurence = Node.new("Laurence Belcher")
Oliver = Node.new("Oliver Platt")
Elisabeth = Node.new("Elisabeth Shue")
Jerry = Node.new("Jerry O'Connell")


Xmen_first = Graph.new("X-Men: First Class")
Kevin.add_actor_to_film(Xmen_first)
Jenn.add_actor_to_film(Xmen_first)
James.add_actor_to_film(Xmen_first)
Laurence.add_actor_to_film(Xmen_first)
Oliver.add_actor_to_film(Xmen_first)

Shrek = Graph.new("Shrek")
Eddie.add_actor_to_film(Shrek)
John.add_actor_to_film(Shrek)

Hollow_Man = Graph.new("Hollow Man")
Kevin.add_actor_to_film(Hollow_Man)
Elisabeth.add_actor_to_film(Hollow_Man)

Piranha = Graph.new("Piranha 3D")
Elisabeth.add_actor_to_film(Piranha)
Jerry.add_actor_to_film(Piranha)

Footloose = Graph.new("Footloose")
Kevin.add_actor_to_film(Footloose)
John.add_actor_to_film(Footloose)

print "Eddie's connection(s):\n"
Eddie.find_kevin_bacon
puts
print "Oliver's connection(s):\n"
Oliver.find_kevin_bacon
puts
print "Jerry's connection(s):\n"
Jerry.find_kevin_bacon
