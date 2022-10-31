require_relative 'tree.rb'

array = [4, 7, 5, 9, 7, 1, 4, 2]
tree = Tree.new(array)
tree.pretty_print

tree.insert(19)
tree.insert(20)

tree.pretty_print

tree.delete(20)

tree.pretty_print





