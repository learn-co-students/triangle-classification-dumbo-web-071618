require 'pry'
class Triangle
  attr_accessor :side_one, :side_two, :side_three

  def initialize (side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
  end

  def kind
    if @side_one <= 0 || @side_two <= 0 || @side_three <= 0
      begin
        raise TriangleError
      end
    end

    if @side_one + @side_two <= @side_three || @side_two + @side_three <= @side_one || @side_three + @side_one <= @side_two
      begin
        raise TriangleError
      end
    end

    if @side_one == @side_two && @side_two == @side_three
        return :equilateral
      elsif @side_one == @side_two || @side_two == @side_three || @side_one == @side_three
        return :isosceles
    else
      return :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "This is not a valid triangle."
    end
  end
end
