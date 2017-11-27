def recursive_search(array, target)
  min = 0
  max = array.size - 1

  return "taget: #{target} not found" if max < min
    mid = (min + max) / 2

  return "target: #{target} found" if array[mid] == target

  if target > array[mid]
    min = mid + 1
    recursive_search(array[min..max], target)
  else
    max = mid - 1
    recursive_search(array[min..max], target)
  end
end
letters = ['a','b','c','d','e','f','g']
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts recursive_search(letters, 'e')
puts recursive_search(letters, 'z')
puts recursive_search(numbers, 9)
puts recursive_search(numbers, 12)
