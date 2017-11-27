def binary_search(collection, value)
  low = 0
  high = collection.length - 1
  mid = collection.length / 2

  while low <= high
    mid = (low + high) / 2

    if collection[mid] > value
      high = mid - 1
    elsif collection[mid] < value
      low = mid + 1
    else
      return "search returned #{collection[mid]} @ index #{mid}"
    end
  end
  return "value: #{value} not found"
end

ary = ['a','b','c','d','e','f','g']
puts binary_search(ary, 'e')
puts binary_search(ary, 'z')
