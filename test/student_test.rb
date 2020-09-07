require 'minitest/autorun'
require 'minitest/pride'
require './lib/student'

class StudentTest < Minitest::Test

  def test_it_exists
    student = Student.new({name: "Morgan", age: 21})

    assert_instance_of Student, student
  end

  def test_it_has_attributes
    student = Student.new({name: "Morgan", age: 21})

    assert_equal "Morgan", student.name
    assert_equal 21, student.age
  end

  def test_starts_with_no_scores
    student = Student.new({name: "Morgan", age: 21})

    assert_equal [], student.scores
  end

  def test_scores_can_be_logged
    student = Student.new({name: "Morgan", age: 21})

    student.log_score(89)
    student.log_score(78)

    assert_equal [89,78], student.scores
  end

  def test_grade
    student = Student.new({name: "Morgan", age: 21})

    student.log_score(89)
    student.log_score(78)

    assert_equal 83.5, student.grade
  end
end
