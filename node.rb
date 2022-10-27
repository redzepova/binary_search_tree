class Node
    include Comparable
    attr_accessor :value, :left, :right

    def initialize(value, left = nil, right = nil)
        @value = value
        @left = left
        @right = right
    end

    def <=>(other)
        value <=> other.value
    end
end