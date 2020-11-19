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

  def insert(val)

    new_arr = @arr.push(val).sort.uniq
    @root = build_tree(new_arr)
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

tree = Tree.new([1,2,3,4,5,6,7])
tree.pretty_print
print tree.insert(19)
tree.pretty_print
print tree.root

