def sort(collection, start=0, finish=nil)
 if finish == nil
   finish = collection.count - 1
 end

 if start >= finish
   # Done sorting
   return
 end

 # Take a pivot value, at the far left
 pivot = collection[start]

 # Min and Max pointers
 min = start
 max = finish

 # Current open slot
 vacant = min

 while min < max
   if vacant == min # Evaluate collection[max]
     if collection[max] <= pivot # Smaller than pivot, must move
       collection[vacant] = collection[max]
       min += 1
       vacant = max
     else
       max -= 1
     end
   elsif vacant == max # Evaluate collection[min]
     if collection[min] >= pivot # Bigger than pivot, must move
       collection[vacant] = collection[min]
       max -= 1
       vacant = min
     else
       min += 1
     end
   else
     raise "Inconsistent state"
   end
 end

 collection[vacant] = pivot

 sort collection, start, vacant - 1
 sort collection, vacant + 1, finish

 collection
end
