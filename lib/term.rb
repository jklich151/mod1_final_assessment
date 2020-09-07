class Term
  attr_reader :name, :courses

  def initialize(term)
    @name = term
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def students
  stud = @courses.map do |course|
      course.students
    end
    stud.flatten
  end

  def open_courses
    @courses.find_all do |course|
      course.full? == false
    end
  end
end
