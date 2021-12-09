require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'class methods' do
    describe '::average_age' do
      it 'calculates the average age of all students' do
        student_1 = Student.create!(name: "Joe", age: 14, house: "Slytherin")
        student_2 = Student.create!(name: "Harry", age: 13, house: "Griffindor")
        student_3 = Student.create!(name: "Cedric", age: 13, house: "Hufflepuff")
        student_4 = Student.create!(name: "Mouse", age: 16, house: "Ravenclaw")

        expect(Student.average_age).to eq(14)

      end
    end
  end

end
