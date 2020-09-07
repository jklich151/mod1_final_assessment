require 'minitest/autorun'
require 'minitest/pride'
require './lib/student'
require './lib/course'
require './lib/term'

class TermTest < Minitest::Test

  def test_it_exists
    term = Term.new("Winter 2018")

    assert_instance_of Term, term
  end

  def test_it_has_attributes
    term = Term.new("Winter 2018")

    assert_equal "Winter 2018", term.name
  end

  def test_has_multiple_courses
    term = Term.new("Winter 2018")

    assert_equal [], term.courses

    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Chemistry", 3)

    term.add_course(course1)
    term.add_course(course2)

    assert_equal [course1, course2], term.courses
  end

  def test_courses_have_students
    term = Term.new("Winter 2018")

    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Chemistry", 3)

    term.add_course(course1)
    term.add_course(course2)

    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    student3 = Student.new({name: "Jenny", age: 24})
    student4 = Student.new({name: "Tim", age: 25})

    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    course2.enroll(student4)

    assert_equal [student1, student2, student3, student4], term.students
  end

  def test_can_list_open_courses
    term = Term.new("Winter 2018")

    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Chemistry", 3)

    term.add_course(course1)
    term.add_course(course2)

    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    student3 = Student.new({name: "Jenny", age: 24})
    student4 = Student.new({name: "Tim", age: 25})

    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    course2.enroll(student4)

    assert_equal [course2], term.open_courses
  end

  def test_can_return_multiple_open_courses
    term = Term.new("Winter 2018")

    course1 = Course.new("Calculus", 4)
    course2 = Course.new("Chemistry", 3)

    term.add_course(course1)
    term.add_course(course2)

    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    student3 = Student.new({name: "Jenny", age: 24})
    student4 = Student.new({name: "Tim", age: 25})

    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    course2.enroll(student4)

    assert_equal [course1, course2], term.open_courses
  end
end
