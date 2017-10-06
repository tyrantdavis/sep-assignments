def fib(n)
    return n if n < 2
  fib_zero = 0
  fib_one = 1

  (0...(n - 1)).each do
      temp = fib_zero
      fib_zero = fib_one
      fib_one = temp + fib_one
  end
  return fib_one
end

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)
