class Triangle
  attr_accessor :side1, :side2, :side3

  @@triangles = []

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3

    unless triangle_inequality? && sides_greater_than_zero?
      raise TriangleError
    end
    @@triangles << self
  end

  def self.all
    @@triangles
  end

  def triangle_inequality?
    sum_of_1_2 = self.side1 + self.side2
    sum_of_1_3 = self.side1 + self.side3
    sum_of_2_3 = self.side2 + self.side3

    bool_of_1_2 = sum_of_1_2 > self.side1 && sum_of_1_2 > self.side2 && sum_of_1_2 > self.side3
    bool_of_1_3 = sum_of_1_3 > self.side1 && sum_of_1_3 > self.side2 && sum_of_1_3 > self.side3
    bool_of_2_3 = sum_of_2_3 > self.side1 && sum_of_2_3 > self.side2 && sum_of_2_3 > self.side3

    bool_of_1_2 && bool_of_1_3 && bool_of_2_3
  end

  def sides_greater_than_zero?
    @side1 > 0 && @side2 > 0 && side3 > 0
  end

  def is_equilateral?
    @side1 == @side2 && @side2 == @side3
  end

  def is_isosceles?
    if self.is_equilateral?
      false
    else
      @side1 == @side2 || @side2 == @side3 || @side1 == @side3
    end
  end

  def is_scalene?
    @side1 != @side2 && @side2 != @side3 && @side1 != @side3
  end

  def kind
    case
    when is_equilateral?
      :equilateral
    when is_isosceles?
      :isosceles
    when is_scalene?
      :scalene
    else
      raise TriangleError
    end
  end
  
  class TriangleError < StandardError
    def initialize
      "This is not a valid triangle."
    end
  end
end
