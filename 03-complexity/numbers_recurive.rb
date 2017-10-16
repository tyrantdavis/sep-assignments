def numbers(n)
 if (n == 0)
   return 0
 elsif (n == 1)
   return 1
 else
   return numbers(n-1) + numbers(n-2)
 end
end
