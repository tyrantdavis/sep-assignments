For poorly_written_ruby the inital loop performs at O(n). The suceeding nested loops places every
element from the combined_array into the sorted_array and performs at O(n^2). Together the
performance is n + n^2 => O(n^2).

1. The initial loop performs at O(n). That following nested loop performs O(n). Combined
performance is O(n) * O(n) => O(n^2)

2. O(log N)

3. space_ruby is a Bubble sort and its space complexity is O(1). Although the function allocates the
tmp variable for each element in the collection it remains a constant time operation given that the
variable assignment always takes the same amount of space & time to execute.
