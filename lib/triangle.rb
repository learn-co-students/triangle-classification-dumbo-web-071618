class Triangle
  
  def initialize(side1, side2, side3)
    a = side1 + side2
    b = side1 + side3
    c = side2 + side3
  end
    
  def kind
    if a > side3 && b > side2 && c > side1
      if a = b && a = c && b = c
        :equilateral
      elsif (a = b && a != c) || (a = c && a != b) || (b = c && b != a)
        :isosceles
      elsif a != b && a != c && b != c
        :scalene
      end
    else
      begin
        raise TriangleError
      rescue TriangleError => exception
        puts exception.message
      end
    end
  end

  class TriangleError < StandardError
    def messsage
      "The triangle in sot valid."
    end
  end
end
