class Node
  attr_accessor :data, :right, :left

  def initialize(data)
    @data = data
    @right = nil
    @left = nil
  end

end


class Tree
  def initialize(arr)
    @arr = arr
    @root = self.build_tree(@arr)
  end

  private

  def build_tree(arr)

    return nil if arr.empty?

    arr.sort!.uniq!

    mid_index = arr.length/2
    
    root = Node.new(arr[mid_index])

    root.left = build_tree(arr[0..mid_index - 1])

    root.right = build_tree(arr[mid_index + 1..-1])

    return root
  end
end

tree = Tree.new([1,2,3,4,5])

