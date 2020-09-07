require 'minitest/autorun'
require 'minitest/pride'
require './lib/student'
require './lib/course'

class CourseTest < Minitest::Test

  def test_it_exists
    course = Course.new("Calculus", 2)

    assert_instance_of Course, course
  end

  def test_it_has_attributes
    course = Course.new("Calculus", 2)

    assert_equal "Calculus", course.name
    assert_equal 2, course.capacity
  end

  def test_starts_with_no_students
    course = Course.new("Calculus", 2)

    assert_equal [], course.students
  end

  def test_course_is_not_full
    course = Course.new("Calculus", 2)

    assert_equal false, course.full?
  end

  def test_can_enroll_students
    course = Course.new("Calculus", 2)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})

    course.enroll(student1)
    course.enroll(student2)

    assert_equal [student1, student2], course.students
  end

  def test_course_is_full
    course = Course.new("Calculus", 2)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})

    course.enroll(student1)
    course.enroll(student2)

    assert_equal true, course.full?
  end
end
