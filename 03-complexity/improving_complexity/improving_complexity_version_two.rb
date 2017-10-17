require 'benchmark'

def improve_time(*arrays)
 arrays.flatten!.sort
end

a = [7,8,9]
b =[4,5,6]
c = [1,2,3]
puts improve_time(a,b,c)
