require 'pry'
class Triangle
  
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    
  end
    
  def kind
    a = @side1 + @side2
    b = @side1 + @side3
    c = @side2 + @side3

    if a > @side3 && b > @side2 && c > @side1 && @side1 != 0
      if @side1 == @side2 && @side2 == @side3
        :equilateral
      elsif @side1 == @side2 || @side1 == @side3 || @side2 == @side3
        :isosceles
      else
        :scalene
      end
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end
end
