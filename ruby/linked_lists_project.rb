class LinkedList

  def initialize
    @head = nil
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