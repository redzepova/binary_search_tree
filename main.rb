require_relative 'tree.rb'

array = [5, 3, 1, 4, 2, 10, 7]
tree = Tree.new(array)
tree.pretty_print

tree.insert(9)

tree.pretty_print

tree.insert(12)
tree.insert(11)
tree.pretty_print
tree.delete(12)
tree.pretty_print
 