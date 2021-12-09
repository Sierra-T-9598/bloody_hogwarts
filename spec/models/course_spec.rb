require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe 'class methods' do
    describe '::alphabetize' do
      it 'returns the courses in alphabetical order' do
        student_1 = Student.create!(name: "Joe", age: 14, house: "Slytherin")
        student_2 = Student.create!(name: "Harry", age: 13, house: "Griffindor")

        course_1 = student_1.courses.create!(name: "Herbology")

        course_2 = student_2.courses.create!(name: "Defense")

        StudentCourse.create!(student_id: student_1.id, course_id: course_1.id)
        StudentCourse.create!(student_id: student_1.id, course_id: course_2.id)
        StudentCourse.create!(student_id: student_2.id, course_id: course_2.id)
        StudentCourse.create!(student_id: student_2.id, course_id: course_1.id)

        expect(Course.alphabetize).to eq([course_2, course_1])
      end
    end
  end

end
