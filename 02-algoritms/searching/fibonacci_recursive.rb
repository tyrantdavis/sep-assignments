def recursive_fib(n)
  if (n == 0)
    return 0
  elsif (n == 1)
    return 1
  else
    return recursive_fib(n-1) + recursive_fib(n-2)
  end
end

puts recursive_fib(0)
puts recursive_fib(1)
puts recursive_fib(2)
puts recursive_fib(3)
puts recursive_fib(4)
puts recursive_fib(5)
puts recursive_fib(6)
puts recursive_fib(7)
puts recursive_fib(8)
puts recursive_fib(9)
puts recursive_fib(20)
