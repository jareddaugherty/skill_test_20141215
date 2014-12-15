require_relative 'shapes.rb'

describe Shape do
  describe '#initialize' do
    it 'initializes length, area, and perimeter of a square' do
      square = Square.new({length: 1})
      expect(square.length).to eq (1)
      expect(square.area).to eq (1)
      expect(square.perimeter).to eq (4)
    end

    it 'initializes length, area, and perimeter of a pentagon' do
      pentagon = Pentagon.new({length: 2})
      expect(pentagon.length).to eq (2)
      expect(pentagon.area).to eq (6.88)
      expect(pentagon.perimeter).to eq (10)
    end

    it 'initializes variables as 0 if length is not defined' do
      triangle = Triangle.new
      expect(triangle.length).to eq (0)
      expect(triangle.area).to eq (0)
      expect(triangle.perimeter).to eq (0)
    end
  end
end
