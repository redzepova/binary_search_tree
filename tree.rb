require_relative 'node.rb'

class Tree
    attr_accessor :root

    def initialize(array)
        @root = build_tree(array.uniq.sort)
        puts @root.value
        
    end

    def build_tree(array)
        return if array.empty?
        
        return Node.new(array[0]) if array.length <= 1

        mid = array.length/2
        root = Node.new(array[mid])
        root.left = build_tree(array[0...mid])
        root.left = build_tree(array[mid+1..-1])
        root
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end
      
end

