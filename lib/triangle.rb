class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle #first we need to see if it is a valid triangle, then figure out which kind
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    if a && b && c > 0
      true
    else
      false
    end
  end

  def valid_triangle_inequality?
    a + b > c &&  a + c > b && b + c > a 
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError      
  end 

end
