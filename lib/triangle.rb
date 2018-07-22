require 'pry'

class Triangle

  attr_accessor :side1,:side2,:side3

  def initialize side1=0,side2=0,side3=0
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if @side1 <= 0 || @side2 <= 0 || @side3 <= 0 || @side1 + @side2 <= @side3 || @side1 + @side3 <= @side2 || @side2 + @side3 <= @side1
      # begin
        raise TriangleError
      # rescue TriangleError => error
      #   puts error.message
      # end
    else
      if @side1 != @side2 && @side2 != @side3 && @side1 != @side3
        :scalene
      elsif @side1 == @side2 && @side1 == @side3 && @side2 == @side3
        :equilateral
      else
        :isosceles
      end
    end
  end

  class TriangleError < StandardError
    def message
      "Error"
    end
  end

end

tri = Triangle.new 3,4,5
puts tri.kind
