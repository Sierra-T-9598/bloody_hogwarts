require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit '/students'" do
    it 'shows a list of students with their information' do
      student_1 = Student.create!(name: "Joe", age: 14, house: "Slytherin")
      student_2 = Student.create!(name: "Harry", age: 13, house: "Griffindor")
      student_3 = Student.create!(name: "Cedric", age: 13, house: "Hufflepuff")
      student_4 = Student.create!(name: "Mouse", age: 16, house: "Ravenclaw")

      visit '/students'

      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_1.age)
      expect(page).to have_content(student_1.house)

      expect(page).to have_content(student_2.name)
      expect(page).to have_content(student_2.age)
      expect(page).to have_content(student_2.house)

      expect(page).to have_content(student_3.name)
      expect(page).to have_content(student_3.age)
      expect(page).to have_content(student_3.house)

      expect(page).to have_content(student_4.name)
      expect(page).to have_content(student_4.age)
      expect(page).to have_content(student_4.house)

    end

    it 'displays the average age of all students' do
      student_1 = Student.create!(name: "Joe", age: 14, house: "Slytherin")
      student_2 = Student.create!(name: "Harry", age: 13, house: "Griffindor")
      student_3 = Student.create!(name: "Cedric", age: 13, house: "Hufflepuff")
      student_4 = Student.create!(name: "Mouse", age: 16, house: "Ravenclaw")

      visit '/students'
      save_and_open_page

      expect(page).to have_content("Average Age: 14")
    end
  end
end
