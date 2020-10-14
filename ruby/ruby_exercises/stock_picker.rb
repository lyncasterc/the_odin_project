
def stock_picker(arr)
    run = true
    result = []
    prices = Marshal.load(Marshal.dump(arr))

    while run 
        max = prices.max
        min = prices.min
        if prices.index(max) < prices.index(min)
            prices.delete_at(prices.index(max))
            prices.delete_at(prices.index(min))
    
        else
            result.push(arr.index(min)).push(arr.index(max))
            run=false
    
        end
    end

    return result
end

stocks = [17,3,6,9,15,8,6,1,10]

print stock_picker(stocks)







