def fibs(n)
  fib_nums = [0,1]
  i = 0

  while fib_nums.length <= n
    fib_nums.push(fib_nums[i] + fib_nums[i+1])
    i += 1
  end

  return fib_nums
end

print fibs(5)

puts "\n\n"

def fibs_rec(n,fib_nums=[0,1],i=-1)

  i += 1

  if fib_nums.length == n + 1
    return fib_nums
  else
    fib_nums.push(fib_nums[i] + fib_nums[i+1])
    fibs_rec(n,fib_nums,i)
  end

  
end

print fibs_rec(5)