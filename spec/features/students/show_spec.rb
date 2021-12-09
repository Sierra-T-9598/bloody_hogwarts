require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit "/students/:id"' do
    it 'lists the courses of the student' do
      student_1 = Student.create!(name: "Joe", age: 14, house: "Slytherin")
      student_2 = Student.create!(name: "Harry", age: 13, house: "Griffindor")
      student_3 = Student.create!(name: "Cedric", age: 13, house: "Hufflepuff")
      student_4 = Student.create!(name: "Mouse", age: 16, house: "Ravenclaw")

      course_1 = Course.create!(name: "Defense against the Dark Arts")

      StudentCourse.create!(student_id: student_1.id, course_id: course_1.id)

      course_2 = student_1.courses.create!(name: "Herbology")

      visit "/students/#{student_1.id}"

      expect(page).to have_content(course_1.name)
      expect(page).to have_content(course_2.name)

    end
  end
end
