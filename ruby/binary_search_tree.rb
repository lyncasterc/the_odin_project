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
    
    end
  end 

  def min_val_node
    node = root
    
    return node if node.left.nil?

    while !node.left.nil?
      node = node.left
    end

    return node

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

tree = Tree.new([9,11,3,89,34])
tree_root = tree.root
tree.pretty_print
puts tree.min_val_node

# puts tree.root
