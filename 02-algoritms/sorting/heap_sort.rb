def heapsort(a, len=a.size)
  buildheap(a)
  (len - 1).downto(0) do |i|
    a[0], a[i] = a[i], a[0]
    heapify(a, 0, i)
  end
  a
end

def lchild(i)
  (2 * i) + 1
end

def rchild(i)
  (2 * i) + 2
end

def heapify(a, root, len)
  lchild, rchild = lchild(root), rchild(root)
  max = root

  if lchild < len && a[lchild] > a[max]
    max = lchild
  end

  if rchild < len && a[rchild] > a[max]
    max = rchild
  end

  if max != root
    a[root], a[max] = a[max], a[root]
    heapify(a, max, len)
  else
    a
  end
end

def buildheap(a)
  ((a.size - 1) / 2).downto(0) do |i|
    heapify(a, i, a.size)
  end
  a
end

a = [5,6,3,7,9,11]
puts heapsort(a)
