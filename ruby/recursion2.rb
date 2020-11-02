def recursive_flatten(arr,result = [])

  arr.each do |element|
    if element.kind_of?(Array)
      recursive_flatten(element,result)
    else
      result.push(element)
    end
  end

  return result
end

print recursive_flatten([[1, [8, 9]], [3, 4]])


puts "\n"



def binary_search(arr,search_term)
  mid_index = arr.length / 2
  mid_val = arr[mid_index]
  

  return true if mid_val == search_term
  return false if mid_val != search_term && arr.length <= 1 

  if search_term > mid_val
    binary_search(arr[mid_index + 1..-1],search_term)
  elsif search_term < mid_val
    binary_search(arr[0..mid_index - 1],search_term)
  end 

end

puts binary_search([1,2,3,3,4,5,6,7,8],10)

