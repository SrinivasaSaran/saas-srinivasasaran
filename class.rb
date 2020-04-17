class Student
  def initialize(roll_no, name)
    @roll_no = roll_no
    @name = name
    @is_enrolled = false
  end

  #setter:
  def enroll
    @is_enrolled = "tru"
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
puts student.enroll
student2 = Student.new(716, "Raju")
student2.enroll
puts student2.name
