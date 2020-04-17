class Student
  def initialize(roll_no, name)
    @roll_no = roll_no
    @name = name
    @is_enrolled = false
  end

  def enroll
    @is_enrolled = true
  end

  #These methods, like enroll, which "sets" some value inside an
  #object are called "setters" in object-oriented programming.
end

student = Student.new(715, "Raj") #Creating object for Student class
#puts student.name
#Above line gives error as instance varible is private to
#the object and only instance methods can alter,access them.
student.enroll # Aliter: 'student = Student.new(715, "Raj").enroll'
