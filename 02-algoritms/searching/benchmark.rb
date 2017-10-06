require 'benchmark'

require_relative 'fibonacci_iterative'
require_relative 'fibonnaci_recursive'

Benchmark.bmbm do |x|
  x.report("iterative:")   { iterative_fib(20) }
  x.report("recursive:") { fib(20) }
end
