require 'benchmark'
require_relative 'bucket_sort.rb'
require_relative 'heap_sort.rb'
require_relative 'quick_sort.rb'

ary = (1..30).to_a.shuffle!
Benchmark.bmbm do |x|
  x.report("bucket_sort") { bucketSort(ary) }
  ary.shuffle
  x.report("heap_sort") { heapsort(ary) }
  ary.shuffle
  x.report("quick_sort") { quick_sort(ary) }
  ary.shuffle
end
