class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize (side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

   def kind
     if !is_valid?(@side1, @side2, @side3)
     begin
       raise TriangleError
     end
     else
       if side1 == side2 && side2 == side3
         :equilateral
       elsif side1 == side2 || side2 == side3 || side1 == side3
         :isosceles
       else
         :scalene
      end
    end
   end

   def is_valid?(side1, side2, side3)
     true_or_false = true
     if side1 <= 0 || side2 <= 0 || side3 <= 0
       true_or_false = false
     elsif side1 + side2 < side3 || side1 + side3 < side2 || side2 + side3 < side1
       true_or_false = false
     end
      true_or_false
   end

   class TriangleError < StandardError
     def message
       "Sorry but it is not a valid triangle. The sum of lengths of any two sides should exceed that of the third side. No side can be larger than 0."
     end
   end
end
