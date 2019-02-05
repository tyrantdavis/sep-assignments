def linear_search(collection, target)
	return collection.index(target).nil? ?  "Target #{target} not found." : "Found #{target} @ index #{collection.index(target)}"
end

ary2 = ['g','r','e','a','b','f','z']
puts linear_search(ary2, 'e')
puts
puts linear_search(ary2, 'q')
