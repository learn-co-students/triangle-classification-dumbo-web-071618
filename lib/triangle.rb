require "pry"

class Triangle
  # write code here
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    is_triangle?
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || c == a
      :isosceles
    else
      :scalene
    end
  end

  def is_triangle?
    triangle = (a + b > c) && (a + c > b) && (b + c > a)
    raise TriangleError if triangle == false
  end
end


class TriangleError < StandardError
  def message
    "The lengths you have entered do not make a valid triangle."
  end
end
