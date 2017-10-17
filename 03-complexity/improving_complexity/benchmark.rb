require_relative 'improving_complexity_version_one.rb'
require_relative 'improving_complexity_version_two.rb'

a = [7,8,9]
b =[4,5,6]
c = [1,2,3]

Benchmark.bmbm do |x|
  x.report("improving_complexity_version_one") { improved_poorly_written_ruby(a,b,c) }
  x.report("improving_complexity_version_two")  { improve_time(a,b,c)  }
end
