#Example 1
class Student
  def initialize(roll_no, name)
    @roll_no = roll_no
    @name = name
    @is_enrolled = false
  end

  #setter:
  def enroll
    @is_enrolled = true
  end

  #These methods, like enroll, which "sets" some value inside an
  #object are called "setters" in object-oriented programming.

  #getters:
  def is_enrolled?
    @is_enrolled
  end

  def name
    @name
  end

  def roll_no
    @roll_no
  end
end

student = Student.new(715, "Raj") #Creating object for Student class
#puts student.name
#Above line gives error as instance varible is private to
#the object and only instance methods can alter,access them.
student.enroll
student2 = Student.new(716, "Raju")
student2.enroll
puts student2.name

#Example 3
class Course
  def initialize(name, students)
    @name = name
    @students = students
  end

  # Add more students even after the object is initialized.
  def enroll(new_student)
    @students.push(new_student)
  end

  def is_student_enrolled?(roll_no)
    @students.any? { |student| student.roll_no == roll_no }
  end

  def get_student(roll_no)
    @students.find { |student| student.roll_no == roll_no }
  end
end

saas = Course.new("SaaS 201", [
  Student.new(715, "Raj"),
  Student.new(716, "Sai"),
])

puts saas.is_student_enrolled?(715)   # true
puts saas.is_student_enrolled?(800)   # false
saas.enroll(Student.new(800, "Ned"))
puts saas.is_student_enrolled?(800)   # true
puts saas.get_student(800).name     # Ned

#Example 2

#Violation of 'tell dont ask'
class Course
  def initialize(name, students)
    @name = name
    @students = students
  end

  def students
    @students
  end

  def students=(s)
    @students = s
  end
end

c = Course.new("SaaS", ["A", "B"])
c.students = c.students.concat(["X", "Y"]) # this calls `students=` method

#obeying 'tell dont ask'
class Course
  def initialize(name, students)
    @name = name
    @students = students
  end

  def add_student(student)
    @students.push(student)
  end
end

c = Course.new("SaaS", ["A", "B"])
c.add_student("X")
c.add_student("Y")
