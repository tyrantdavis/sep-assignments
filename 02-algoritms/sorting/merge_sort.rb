def merge_sort(collection)
  if collection.length <= 1
    collection
  else
    mid = (collection.length / 2).floor
    left = merge_sort(collection[0..mid - 1])
    right = merge_sort(collection[mid..collection.length])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

arr1 = ['e', 'c', 'a', 'b', 'f', 'g', 'd']
arr = [3, 6, 1, 2, 8, 4, 9, 7, 5]

p merge_sort(arr)
p merge_sort(arr1)
