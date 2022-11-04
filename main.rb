# frozen_string_literal: true

require_relative 'tree'
require_relative 'node'

array = (Array.new(15) {rand(1..100)})
tree = Tree.new(array)

tree.insert(192)
tree.insert(384)
tree.insert(222)
tree.insert(385)
tree.insert(372)
tree.insert(879)

tree.pretty_print


puts tree.balanced?

tree.rebalance if tree.balanced? == false

tree.pretty_print

puts "tree depth of #{tree.find_node(222)} is #{tree.depth(222)} nodes"