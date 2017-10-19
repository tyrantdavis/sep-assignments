#  input: an unordered array a of length count
def heapsort(a, count= a.size)
  puts "a: #{a}, count: #{count}"
    # (Build the heap in array a so that largest value is at the root)
  heapify(a, count)
  # (The following loop maintains the invariants that a[0:end] is
  # a heap and every element
  # beyond end is greater than everything before it (so
  #a[end:count] is in sorted order))

  stop = count - 1

  while stop > 0 do
  # (a[0] is the root and largest value. The swap moves it in
  # front of the sorted elements.)
    a[stop], a[0] = a[0], a[stop]
    puts "a[stop]: #{a[stop]}, a[0]: #{a[0]}"
  # the heap size is reduced by one
    stop -= 1
    puts stop
    # restores the ruined heap
    siftup(a, 0, stop)
  end
  a
end

def heapify(a, count)
  # stop is assigned the index of the first (left) child of the root
  stop = 1

  while stop < count
    # sift up the node at index end to the proper place such that
    # all nodes above
    # the end index are in heap order
    siftup(a, 0, stop)

    stop += 1
    # after sifting up the last node all nodes should be in heap
   # order
  end
end

def siftup(a, start, stop)
  # start represents the limit of how far up the heap to sift.
  #  stop is the node to sift up.
  puts "stop: #{stop}"
  child = stop
  puts "child = stop: #{stop}"

  while child > start
    iParent = ((child - 1) / 2).floor
    puts "iParent before while: #{iParent}"
    if a[iParent] < a[child] # out of max-heap order
    puts "a[#{iParent}]: #{a[iParent]}, a[#{child}]: #{a[child]} before"
      a[iParent], a[child] = a[child], a[iParent]
    puts "a[#{iParent}]: #{a[iParent]}, a[#{child}]: #{a[child]} after" 

    child = iParent
      puts "child: #{a[child]}"
      puts "swap #{a[child]} with #{a[iParent]}"
    #repeat to continue sifting up the parent now
    else
      return
    end
  end
  puts "a: #{a}"
end

a = [5,6,3,7,9,11]
heapsort(a)
