# frozen_string_literal: true

def bubble_sort(arr)
  #the outer loop is the max amount of iterations it takes to sort the entire array
  (0..arr.length - 1).each do |_i|
    (1..arr.length - 1).each do |i|
      next unless arr[i - 1] > arr[i]

      greater_num = arr[i - 1]
      lesser_num = arr[i]
      arr[i - 1] = lesser_num
      arr[i] = greater_num
    end
  end
  arr
end

nums = [1, 3, 4, 6, 8, 9, 2]
print bubble_sort(nums)
