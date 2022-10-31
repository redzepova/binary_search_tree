require_relative 'node.rb'
require 'pry'

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

    def find_node(value, node = @root)
        return if node.nil?
        if node == value
            return node
        end
        if find_node(value, node.left) == nil
            find_node(value, node.right)
        end
    end

    def delete(value, node = @root)
        #check if node has children
        #if no children, delete node from it's parent
        return if node.nil?
        return if node.has_child? < 1
        value < node.value ? child = node.left : child = node.right

        if child.value == value
            delete_leaf(node, value)
        end

        if delete(value, node.left) == nil
            delete(value, node.right)
        end
    end

    def delete_leaf(parent, value)
        value < parent.value ? parent.left = nil : parent.right = nil   
    end

    def delete_one_child(parent, grandchild, value)
        #if value is greater than parent value, right
        #if value is less than parent value, left

        
    end

    def delete_two_children(parent, direction)
    end
end

