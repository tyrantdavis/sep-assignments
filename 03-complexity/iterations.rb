def iterations(n)
  puts "Worst-Case Linear Search\v"
  print "n"
  puts "    # Iterations O(n)\v"
  (1..n).each do |n|
    puts "#{n}\t #{n} "
  end
end

iterations(10)
