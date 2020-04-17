class Student
  def initialize(roll_no, name)
    @roll_no = roll_no
    @name = name
    @is_enrolled = false
  end
end

student = Student.new(715, "Raj") #Creating object for Student class
#puts student.name # This gives error as instance varible is private
#to the object and only instance methods can alter,access them.
