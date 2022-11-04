# frozen_string_literal: true

require_relative 'tree'
require_relative 'node'

array = [99, 17, 47, 10, 58, 129, 39]
tree = Tree.new(array)

tree.pretty_print