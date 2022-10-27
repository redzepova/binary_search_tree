require_relative 'node.rb'

class Tree
    attr_accessor :root

    def initialize(array)
        @root = build_tree(array.uniq.sort)
    end

    def build_tree(array)
        return if array.empty?
        
        return Node.new(array[0]) if array.length <= 1

        mid = array.length/2
        root = Node.new(array[mid], build_tree(array[0...mid]), build_tree(array[mid + 1 .. -1]))
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    def insert(value, node = @root)
        if value == node.value
            return
        end

        if value < node.value && node.left == nil
            new_node = Node.new(value)
            node.left = new_node
            return
        elsif value > node.value && node.right == nil
            new_node = Node.new(value)
            node.right = new_node
            return
        end

        if value < node.value && node.left
            insert(value, node.left)
        elsif value > node.value && node.right
            insert(value, node.right)
        end
    end

    def delete(value, node = @root)
        return if node.value == nil
    end
      
end

