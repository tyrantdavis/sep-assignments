# This method takes n arrays as input and combine them in sorted ascending  order
def improved_poorly_written_ruby(*arrays)
  sorted = []
  arrays.flatten.each do |v|
    size = sorted.size
    if  sorted.empty?
      sorted.push(v)
    else
      i = 0
      while i < size
        item = sorted[i]
        if item > v
          sorted.insert(i, v)
          break
        elsif i == size - 1
          sorted.push(v)
          break
        end
        i += 1
      end
    end
  end
  sorted
end

a = [7,8,9]
b =[4,5,6]
c = [1,2,3]
p improved_poorly_written_ruby(a,b,c)
