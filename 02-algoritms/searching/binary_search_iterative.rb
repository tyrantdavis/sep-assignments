def binary_search(collection, target)
  low = 0
  high = collection.length - 1
  mid = collection.length / 2

  while low <= high
    mid = (low + high) / 2
    if collection[mid] > target
      high = mid - 1
    elsif collection[mid] < target
      low = mid + 1
    else
      return "Search returned target: #{collection[mid]} @ index #{mid}"
    end
  end
  return "Target: #{target} not found"
end

ary = ['a','b','c','d','e','f','g']
ary2 = ['g','r','e','a','b','f','z']
puts binary_search(ary, 'e')
puts
puts binary_search(ary2.sort, 'z')
puts
puts binary_search(ary2.sort, 'c')
