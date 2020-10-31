#recursive 
def sum_upto(n) 
  if n == 1 #base case
    return 1
  else
    return sum_upto(n - 1) + n
  end
end

puts sum_upto(1)

#non-recursive
def sum_up_to(n)
  sum = 0

  for i in (1..n)
    sum += i
  end
  return sum
end

puts sum_up_to(1)

# appending pos integers from n until 0 (ex. if n is 3: [3,2,1,0])
def append_upto(arr,n)

  arr.push(n)
  
  if n == 0 #base case
    return arr
  else
    return append_upto(arr,(n - 1))
  end

end

print append_upto([],30)

puts "\n\n"

def reverse_append_upto(arr,n)
  
  if n == 0
    arr.push(n)
    return arr
  else
    return reverse_append_upto(arr, n - 1)
  end

  
end


print reverse_append_upto([],3)


