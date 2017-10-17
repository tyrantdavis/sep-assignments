def space_ruby(*arrays)
    return bubble_sort(arrays.flatten!)
end

def bubble_sort(collection)
  n = collection.length
  # #1
  begin
    swapped = false

    # #2
    (n - 1).times do |i|
      # #3
      if collection[i] > collection[i + 1]
        tmp = collection[i]
        collection[i] = collection[i + 1]
        collection[i + 1] = tmp
        swapped = true
      end
    end
  end until not swapped

  collection
end

a = [7,8,9]
b =[4,5,6]
c = [1,2,3]
puts space_ruby(a,b,c)
