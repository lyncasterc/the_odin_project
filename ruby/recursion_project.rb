def fibs(n)
  fib_nums = [0,1]
  i = 0

  while fib_nums.length <= n
    fib_nums.push(fib_nums[i] + fib_nums[i+1])
    i += 1
  end

  return fib_nums
end

puts fibs(5)

def fibs_rec(n,)
  

end

print fibs_rec(6)