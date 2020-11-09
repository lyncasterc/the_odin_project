class LinkedList

  def initialize
    @head = nil
  end

  def to_s
    node = @head

    #if length of list is one 
    return " " if node.nil?
    return "( #{node} ) -> nil" if node.next_node.nil?    

    while !node.next_node.nil?
      print "( #{node} ) -> "
      node = node.next_node

      #reaching the end of the list
      if node.next_node.nil?
        return "( #{node} ) -> nil"
      end
    end
  end

  def push(value)
    if @head.nil?
      @head = Node.new(value)
    else
      tail_node = self.tail
      tail_node.next_node = Node.new(value)
    end
  end

  def unshift(value)
    old_head = @head
    new_head = Node.new(value, old_head)
    @head = new_head
  end

  def insert_at(index, value)
    len = self.length

    if index == 0 || index == -len
      self.unshift(value)
    elsif index == len - 1 || index == -1
      self.push(value)
    elsif index < len - 1 && index > -len
      self.at(index - 1).next_node = Node.new(value, self.at(index))
    else raise "Out of Range"
    end

  end

  def pop
    @head

    if @head.nil?
      return ""
    end

    if @head.next_node.nil?
      @head.value = nil
      @head = nil
    else
      new_tail = self.at(-2)
      new_tail.next_node = nil
    end  
  end

  def remove_at(index)
    len = self.length

    if index == 0 || index == -len
      @head = @head.next_node

    elsif index == len - 1 || index == -1
      self.pop

    elsif index < len - 1 && index > -len
      self.at(index - 1).next_node=self.at(index + 1)

    else raise "Out of Range"
    end
  end

  def length
    node = @head
    count = 1

    return 0 if node.nil?

    while !node.next_node.nil?
      node = node.next_node
      count += 1
    end

    return count
  end

  def at(index)
    count = 0
    node = @head
    len = self.length

    return node if count == index % len

    while !node.next_node.nil?
      node = node.next_node
      count += 1

      return node if count == index % len
    end
  end

  def contains?(value)
    node = @head
    
    return true if self.tail.value == value

    while !node.next_node.nil?
      if node.value == value
        return true
      end
      node = node.next_node
    end

    return false
  end

  def find(value)
    node = @head
    count = 0

    return self.length - 1 if self.tail.value == value

    while !node.next_node.nil?
      if node.value == value
        return count
      end
      node = node.next_node
      count += 1
    end

    return 

  end

  def tail
    tail_node = @head

    if tail_node.next_node.nil?
      return tail_node
    else
      while !tail_node.next_node.nil?
        tail_node = tail_node.next_node
      end
      return tail_node
    end
  end

  def head
    if @head.nil?
      return "nil"
    else
      return @head.value
    end
  end

  

end

class Node

  attr_accessor :value, :next_node
  
  def initialize(value = nil,next_node = nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    return "#{@value}"
  end
end

list = LinkedList.new()




















