# #Assignment 1
# def fibs(n)
#   fib_nums = [0,1] 
#   i = 0

#   while fib_nums.length < n
#     fib_nums.push(fib_nums[i] + fib_nums[i+1])
#     i += 1
#   end

#   return fib_nums
# end

# print fibs(20)

# puts "\n\n"

# def fibs_rec(n,fib_nums=[0,1],i=-1)

#   i += 1

#   if fib_nums.length == n  #base case
#     return fib_nums
#   else
#     fib_nums.push(fib_nums[i] + fib_nums[i+1])
#     fibs_rec(n,fib_nums,i)
#   end

  
# end

# print fibs_rec(20) 

# #Assignment 2

def merge(left,right)
  merged_arr = []

  until left.empty? || right.empty?
    if left.first <= right.first
      merged_arr.push(left.shift)
    else
      merged_arr.push(right.shift)
    end
  end

  merged_arr + left + right
end

def merge_sort(arr)

  if arr.length < 2
    return arr
  end

  m_index = arr.length/2

  left_half = merge_sort(arr.slice(0...m_index))

  right_half = merge_sort(arr.slice(m_index..-1))

  return merge(left_half,right_half)

end


print merge_sort([4,8,6])

