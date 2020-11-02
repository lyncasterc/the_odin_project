def countdown(i)
  puts i

  if i <= 1
    return 
  else
    countdown(i-1)
  end
end

countdown(5)

puts "\n\n"


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
  if n < 0
    return arr
  else
    reverse_append_upto(arr,n-1)
    arr.push(n)
    return arr
  end

end

print reverse_append_upto([],3)


#non-recursive
def factorial(n)
  factorial_calc = 1

  for i in (1..n)
    factorial_calc *= i
  end
  return factorial_calc
end

puts factorial(3)


#recursive
def recursive_factorial(n)
  if (0..1).include?(n)
    return 1
  else
    return recursive_factorial(n-1) * n
  end
end

puts recursive_factorial(3)


def is_palindrome(str)

  if str.length == 1 || str.length == 0
    return true
  end
  if str[0] == str[-1]
    is_palindrome(str[1..-2])
  else 
    return false
  end
end

puts is_palindrome("boob")



def bottles_of_beer(n)
  if n == 0
    puts "no more bottle of beer on the wall"
  else
    puts "#{n} bottle of beer on the wall"
    bottles_of_beer(n - 1)
  end
end


bottles_of_beer(3)

def nth_fibonacci(n)
  return n if n == 0 || n == 1

  return nth_fibonacci(n-1) + nth_fibonacci(n-2)
  
  end 


puts nth_fibonacci(2)


#collatz - it's always possible to return back to 1 from any positive integer
  # 
def collatz(n)

  if n == 1
    return 1
  elsif n % 2 == 0
    return collatz(n/2)
  else
    return collatz((3 * n) + 1)
  end
end

puts "\n\n"

puts collatz(1009473) 


