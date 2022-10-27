require_relative 'tree.rb'

array = [4, 7, 5, 9, 7, 1, 4, 2, 10, 3, 6, 8]
tree = Tree.new(array)
tree.pretty_print

puts tree.insert(17)

tree.pretty_print

tree.insert(19)
tree.insert(18)

tree.pretty_print




