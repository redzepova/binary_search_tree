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

puts tree.balanced?

tree.rebalance if tree.balanced? == false

tree.pretty_print

pre_order = []
post_order = []
in_order = []

tree.pre_order {|node| pre_order << node.value}
tree.post_order {|node| post_order << node.value}
tree.inorder {|node| in_order << node.value}

puts "Level order: #{tree.level_order}"
puts "Pre-order: #{pre_order}"
puts "Post-order: #{post_order}"
puts "In-order: #{in_order}"


