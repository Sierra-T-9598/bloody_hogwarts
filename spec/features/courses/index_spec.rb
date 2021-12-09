require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit '/courses'" do
    it 'lists the courses and their number of respective students' do
      student_1 = Student.create!(name: "Joe", age: 14, house: "Slytherin")
      student_2 = Student.create!(name: "Harry", age: 13, house: "Griffindor")

      course_1 = Course.create!(name: "Herbology")

      course_2 = Course.create!(name: "Defense")

      StudentCourse.create!(student_id: student_1.id, course_id: course_1.id)
      StudentCourse.create!(student_id: student_1.id, course_id: course_2.id)
      StudentCourse.create!(student_id: student_2.id, course_id: course_2.id)
      StudentCourse.create!(student_id: student_2.id, course_id: course_1.id)

      visit '/courses'

      expect(page).to have_content(course_1.name)
      expect(page).to have_content(course_1.students.count)
      expect(page).to have_content(course_2.name)
      expect(page).to have_content(course_2.students.count)
    end
  end

  it 'lists courses in alphabetical order' do
    student_1 = Student.create!(name: "Joe", age: 14, house: "Slytherin")
    student_2 = Student.create!(name: "Harry", age: 13, house: "Griffindor")

    course_1 = student_1.courses.create!(name: "Herbology")

    course_2 = student_2.courses.create!(name: "Defense")

    StudentCourse.create!(student_id: student_1.id, course_id: course_1.id)
    StudentCourse.create!(student_id: student_1.id, course_id: course_2.id)
    StudentCourse.create!(student_id: student_2.id, course_id: course_2.id)
    StudentCourse.create!(student_id: student_2.id, course_id: course_1.id)

    visit '/courses'

    expect("#{course_2.name}").to appear_before("#{course_1.name}")
    expect("#{course_1.name}").to_not appear_before("#{course_2.name}")

  end
end
