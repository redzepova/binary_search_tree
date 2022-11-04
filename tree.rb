# frozen_string_literal: true

require_relative 'node'
require 'pry'

class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array.uniq.sort)
  end

  def build_tree(array)
    return if array.empty?

    return Node.new(array[0]) if array.length <= 1

    mid = array.length / 2
    root = Node.new(array[mid], build_tree(array[0...mid]), build_tree(array[mid + 1..]))
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(value, node = @root)
    return if value == node.value

    if value < node.value && node.left.nil?
      new_node = Node.new(value)
      node.left = new_node
      return
    elsif value > node.value && node.right.nil?
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
    return node if node.value == value

    if value > node.value
      find_node(value, node.right)
    else
      find_node(value, node.left)
    end
  end

  def delete(value, node = @root)
    return if node.has_child? < 1

    if @root.value = value
      delete_root(@root, value)
      return
    end
    child = value < node.value ? node.left : node.right
    if child.value == value
      if child.has_child? < 1
        delete_leaf(node, value)
      elsif child.value == value && child.has_child? == 1
        delete_one_child(node, child, value)
      else
        delete_two_children(node, child, value)
      end
      return
    end

    delete(value, child)
  end

  def delete_root(node, value)
    if node.has_child? < 1
      nil
    elsif node.has_child? == 1
      child = node.return_one_child
      @root = child
    else
      child = node.left
      delete_two_children(node, child, value)
      @root = child
    end
  end

  def delete_leaf(parent, value)
    value < parent.value ? parent.left = nil : parent.right = nil
  end

  def delete_one_child(parent, child, value)
    grandchild = child.return_one_child

    value < parent.value ? parent.left = grandchild : parent.right = grandchild
  end

  def delete_two_children(parent, child, value)
    if child.has_child? < 1
      reassign_left_child(parent, child, value)
      return
    elsif child.left.nil? == true
      swap_grandchild(parent, child, child.right)
      return
    end
    left_grandchild = child.left
    delete_two_children(child, left_grandchild, value)
    reassign_left_child(parent, child, value)
  end

  def reassign_left_child(parent, child, value)
    if child.value == value
      parent.left = child.left
      child.left = nil
    else
      child.right = parent.right
    end
  end

  def swap_grandchild(parent, child, grandchild)
    parent.left = grandchild
    grandchild.left = child
    child.right = nil
  end

  def level_order
    queue = [@root]
    result = []

    until queue.empty?
      node = queue.shift
      block_given? ? yield(node) : result << node.value
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end

    result
  end

  def post_order(node = @root, &block)
    return if node.nil?

    post_order(node.left, &block)
    post_order(node.right, &block)

    access_node(node, &block)
  end

  def pre_order(node = @root, &block)
    return if node.nil?

    access_node(node, &block)

    pre_order(node.left, &block)
    pre_order(node.right, &block)
  end

  def inorder(node = @root, &block)
    return if node.nil?

    inorder(node.left, &block)

    access_node(node, &block)

    inorder(node.right, &block)
  end

  def access_node(node, &block)
    if block_given?
        yield(node)
    else
        puts node.value
    end
  end

  def height(node = @root, i = 0, value = nil)
    return i if node.nil?
    node = find_node(value) if value.nil? == false
    return i if node.has_child? == 0

    i += 1

    (height(node.left, i)..height(node.right, i)).max
  end

  def depth(node = @root, i = 0); end

  def balanced?
    node = @root
    left = height(node.left, 1)
    right = height(node.right, 1)

    (left - right).abs > 1 ? result = false : result = true

    return result
  end
  
  def rebalance
    array = []
    inorder { |node| array << node.value }
    @root = build_tree(array.uniq.sort)
  end
end
