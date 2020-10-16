def bubble_sort(arr)

    for i in (0..arr.length-1)
        for i in (1..arr.length-1)
            if arr[i-1] > arr[i]
                greater_num = arr[i-1]
                lesser_num = arr[i]
                arr[i-1] = lesser_num
                arr[i] = greater_num
            end
        end
    end
    return arr
end  

nums = [1,3,4,6,8,9,2]
print bubble_sort(nums)

