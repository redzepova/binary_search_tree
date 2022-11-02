require_relative 'tree.rb'

array = [99, 17, 47, 10, 58, 129, 39, 11, 98, 31, 44, 22, 56, 33, 49, 43, 28, 27, 17, 46, 32, 7, 74, 90, 26, 60]
tree = Tree.new(array)

tree.insert(8)

tree.pretty_print

tree.delete(27)

tree.pretty_print
 