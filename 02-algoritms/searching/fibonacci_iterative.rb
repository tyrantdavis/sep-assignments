def iterative_fib(n)
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
puts iterative_fib(20)
# puts iterative_fib(0)
# puts iterative_fib(1)
# puts iterative_fib(2)
# puts iterative_fib(3)
# puts iterative_fib(4)
# puts iterative_fib(5)
# puts iterative_fib(6)
# puts iterative_fib(7)
# puts iterative_fib(8)
# puts iterative_fib(9)
