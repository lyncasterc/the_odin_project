class Node
  attr_accessor :data, :right, :left

  def initialize(data=nil)
    @data = data
    @left = nil
    @right = nil
  end

  def to_s
    return @data.to_s
  end
end


class Tree
  attr_reader :root

  def initialize(arr)
    @arr = arr
    @root = build_tree(arr)
  end

  public
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(root, val)
    return Node.new(val) if root.nil?

    if root.data == val
      return root
    elsif val < root.data
      root.left = insert(root.left, val)
    elsif val > root.data
      root.right = insert(root.right, val)
    end

    return root
  end

  def delete(root, val)
    return root if root.nil?

    if val < root.data
      root.left = delete(root.left, val)
    elsif val > root.data
      root.right = delete(root.right, val)
    else
      if root.left.nil?
        temp = root.right
        root = nil
        return temp
      elsif root.right.nil?
        temp = root.left
        root = nil
        return temp
      end

      temp = min_val_node(root.right)
      root.data = temp.data

      root.right = delete(root.right, temp.data)

      return root 
    
    end
  end 

  def min_val_node(node)
    current = node
    return current if current.left.nil?

    while !current.left.nil?
      current = current.left
    end

    return current
  end

  def find(root, val)
    return nil if root.nil?
    return root if root.data == val

    if val < root.data
      find(root.left, val)
    elsif val > root.data
      find(root.right, val)
    end

    
  end

  def level_order
    root = @root
    queue = []
    result = []

    return queue if root.nil?

    queue.push(root)
    
    while !queue.empty?
      result.push(root.data)
      queue.push(root.left) if !root.left.nil?
      queue.push(root.right) if !root.right.nil?
      queue.shift
      root = queue[0]
    end

    return result
  end

  def inorder(root)
    result = []
    return nil if root.nil?
    
    



  end


  private
  def build_tree(arr)

    arr.sort!.uniq!

    return nil if arr.empty?

    if arr.length == 1 
      root = Node.new(arr[0])
      return root
    end

    mid_index = arr.length/2
    
    root = Node.new(arr[mid_index])

    root.left = build_tree(arr[0..mid_index - 1])

    root.right = build_tree(arr[mid_index + 1..-1])

    return root
  end
end

tree = Tree.new([2,3,7,10,13,11,30])
tree.pretty_print
print tree.inorder(tree.root)




