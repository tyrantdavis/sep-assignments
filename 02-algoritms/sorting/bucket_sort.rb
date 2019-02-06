def bucketSort(array, bucket_size = 5)
  if array.size < 2
    return array
  end

  # Determine minimum and maximum values
  min_value = array.min
  max_value = array.max
  # Initialise buckets
  bucket_count = ((max_value - min_value) / bucket_size).floor + 1
  buckets = Array.new(bucket_count)
  (0..buckets.length - 1).each do |i|
    buckets[i] = []
  end

  # Distribute input array values into buckets
  (0..array.length - 1).each do |i|
    buckets[((array[i] - min_value) / bucket_size).floor].push(array[i])
  end

  # Sort buckets and place back into input array
  array = []
  (0..buckets.length - 1).each do |i|
    buckets[i] = insertionSort(buckets[i])
    buckets[i].each do |value|
      array.push(value)
    end
  end
  array
end

def insertionSort(collection)

  sorted_collection = [collection.delete_at(0)]

  for val in collection
    sorted_collection_index = 0

    while sorted_collection_index < sorted_collection.length
      if val <= sorted_collection[sorted_collection_index]
        sorted_collection.insert(sorted_collection_index, val)
        break
      elsif sorted_collection_index == sorted_collection.length - 1
        sorted_collection.insert(sorted_collection_index + 1, val)
        break
      end
      sorted_collection_index += 1
    end
  end

  sorted_collection
end




p bucketSort([3, 6, 1, 2, 8, 4, 9, 7, 5])
