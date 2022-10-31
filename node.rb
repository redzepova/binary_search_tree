class Node
    include Comparable
    attr_accessor :value, :left, :right

    def initialize(value, left = nil, right = nil)
        @value = value
        @left = left
        @right = right
    end

    def has_child?
        if @left.nil? && @right.nil?
            return 0
        elsif @left != nil && @right != nil
            return 2
        else
            return 1
        end
    end
   
    def <=>(other)
        value = other.class == Node ? other.value : other
        @value <=> value
    end
end