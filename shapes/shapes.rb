# Question 3:

require 'csv'

module ShapeParser
  def self.shape_factory(path)
    CSV.foreach(path) do |row|
      if row[0]
        new_shape = Kernel.const_get(row[0].capitalize).new({length: row[1]})
        new_shape.print_shape_info({shape_number: $.})
      end
    end
  end
end

class Shape
  include ShapeParser
  attr_reader :length, :area, :perimeter

  def initialize(args={})
    @length = args[:length].to_f
    @perimeter = shape_perimeter
    @area = shape_area
  end

  def print_shape_info(args={})
    puts "Shape #{args[:shape_number]} is a #{self.class}, with a length of #{self.length}, having a perimeter of #{self.perimeter}, and an area of #{self.area} units square"
  end
end

class Square < Shape

  def shape_perimeter
    self.length * 4
  end

  def shape_area
    self.length**2
  end
end

class Circle < Shape

  def shape_perimeter
    2 * 3.14 * self.length
  end

  def shape_area
    3.14 * self.length ** 2
  end
end

class Pentagon < Shape

  def shape_perimeter
    self.length * 5
  end

  def shape_area
    1.72 * self.length**2
  end

end

class Triangle < Shape

  def shape_perimeter
    self.length * 3
  end

  def shape_area
    self.length ** 2 * 0.5
  end
end

ShapeParser.shape_factory('shapes/shapes.csv')



