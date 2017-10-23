def quick_sort(collection)
  return collection if collection.length <= 1
# arr1 = ['e', 'c', 'a', 'b', 'f', 'g', 'd']
  pivot = collection.delete_at(collection.length - 1)
  left = []
  right = []
  sorted = []

  collection.each do | value |
    if value < pivot
      left.push(value)
    else
      right.push(value)
    end
  end
  sorted.push(quick_sort(left))
  sorted.push(pivot)
  sorted.push(quick_sort(right))
  return sorted.flatten
end

arr1 = ['e', 'c', 'a', 'b', 'f', 'g', 'd']
arr = [3, 6, 1, 2, 8, 4, 9, 7, 5]
puts "#{quick_sort(arr)}"
puts "#{quick_sort(arr1)}"
