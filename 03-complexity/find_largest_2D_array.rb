def find_largest(collection)
 largest = collection[0][0]
 collection.length.times do |i|
   subcollection = collection[i]
   subcollection.length.times do |i|
     if subcollection[i] >= largest
       largest = subcollection[i]
     end
   end
 end
 largest
end
