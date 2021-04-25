class Calculator

  def add(a,b, *args)
    sum = a + b
    if args.empty?
      return sum
    else
      args.each do |arg|
        sum += arg
      end
    end
    return sum
  end

  def subtract(a,b, *args)
    difference = a - b
    if args.empty?
      return difference
    else
      args.each do |arg|
        difference -= arg
      end
    end
    return difference
  end

  
  def multiply(a,b, *args)
    product = a * b
    if args.empty?
      return product
    else
      args.each do |arg|
        product *= arg
      end
    end
    return product
  end

  def divide(a,b, *args)
    quotient = a / b
    if args.empty?
      return quotient
    else
      args.each do |arg|
        quotient /= arg
      end
    end
    return quotient
  end


end

boop = Calculator.new

# puts boop.add(1,2,3)
# puts boop.multiply(3,4,2)

puts boop.subtract(5,2)