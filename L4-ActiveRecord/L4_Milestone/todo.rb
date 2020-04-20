require "active_record"

class Todo < ActiveRecord::Base
  def self.overdue
    where("due_date < ?", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = nil if due_date == Date.today
    display_date = due_date if due_date != Date.today
    "#{id}. #{display_status} #{todo_text} #{display_date}"
  end

  def self.add_task(new_task)
    create!(todo_text: new_task[:todo_text], due_date: Date.today + new_task[:due_in_days], completed: false)
  end

  def self.mark_as_complete!(completed_id)
    todo = find(completed_id)
    todo.completed = true
    todo.save
    todo
  end

  def self.show_list
    puts "\n\nMy Todo-list\n\n"

    puts "Overdue\n"
    puts overdue.map { |todo| todo.to_displayable_string }
    puts "\n\n"

    puts "Due Today\n"
    puts due_today.map { |todo| todo.to_displayable_string }
    puts "\n\n"

    puts "Due Later\n"
    puts due_later.map { |todo| todo.to_displayable_string }
    puts "\n\n"
  end
end
