# Question 3:

# a. Create a program that is capable of reading in the contents of a csv file.
# b. This csv file holds information about various different regular polygons and circles.  Each entry in the cvs file holds the name of the shape and the length of it's side, or in the case of a circle, it's radius.  You should be able to calculate the perimeter and area of these regular polygons.

# eg contents of the csv
# square,5
# pentagon,3
# triangle,2.5
# circle,2
# c. Your program should output the following:

# Shape 1 is a square, with side length 5, having a perimeter of 20 and an area of 25 units square.
# ...
# ...
# Shape 4 is a circle, with a radius of 2, having a perimeter of 12.57 and an area of 12.57 units square.

# Your solution should ideally use objects and classes, and some unit testing.  You don't need to adopt a unit test framework, just the basics to feel like you have decent coverage.


require 'csv'

module ShapeParser
	def self.shape_factory(path)
		CSV.foreach(path) do |row|
			new_shape = Kernel.const_get(row[0].capitalize).new({length: row[1]})
			new_shape.print_shape_info({shape_number: $.})
		end
	end
end

class Shape
	include ShapeParser
	attr_reader :type, :length

	def initialize(args={})
		@length = args[:length].to_f
		@perimeter = shape_perimeter
		@area = shape_area
	end

	def print_shape_info(args={})
		puts "Shape #{args[:shape_number]} is a #{self.class}, with a length of #{self.length}, having a perimeter of #{self.shape_perimeter}, and an area of #{self.shape_area} units square"
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

ShapeParser.shape_factory('shapes.csv')



