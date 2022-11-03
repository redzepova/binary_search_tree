# frozen_string_literal: true

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
      0
    elsif !@left.nil? && !@right.nil?
      2
    else
      1
    end
  end

  def return_one_child
    if @left.nil?
      @right
    else
      @left
    end
  end

  def <=>(other)
    value = other.instance_of?(Node) ? other.value : other
    @value <=> value
  end
end
