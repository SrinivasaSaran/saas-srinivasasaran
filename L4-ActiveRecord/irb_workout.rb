require "./connect_db.rb"
require "./todo.rb"
connect_db!

#1 create
Todo.create!(todo_text: "Buy groceries", due_date: Date.today + 4, completed: false)
Todo.create!(todo_text: "Call Acme Corp.", due_date: Date.today + 2, completed: true)
Todo.create!(todo_text: "File taxes", due_date: Date.today, completed: false)

#2 read
puts Todo.all, "\n"
puts Todo.all[2], "\n"
puts Todo.first, "\n"
puts Todo.last, "\n"
puts Todo.where(completed: false) #Hash argument
puts Todo.where(
  "completed = ? and due_date > ?",
  false,
  Date.parse("2020-02-04")
) # String argument
# "?"" are called placeholders and will be matched against the rest of the arguments in order
puts Todo.find_by(completed: false) # returns only 1st match
puts Todo.all[2].id
puts Todo.find(1) # outputs row with matching id
puts Todo.find(1).due_date
puts Todo.first.todo_text

# alter
todo = Todo.first
todo.todo_text = "Buy groceries and fruits"
todo.save
