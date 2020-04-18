require "active_record"

class Todo < ActiveRecord::Base
  def overdue
    due_date < Date.today
  end

  def due_today
    due_date == Date.today
  end

  def due_later
    due_date > Date.today
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today ? nil : due_date
    "#{id}. #{display_status} #{todo_text} #{display_date}"
  end

  def self.add_task(new_task)
    create!(todo_text: new_task[:todo_text], due_date: Date.today + new_task[:due_in_days], completed: false)
  end

  def self.show_list
    puts "\n\nMy Todo-list\n\n"

    puts "Overdue\n"
    puts all.select { |todo| todo.overdue }.map { |todo| todo.to_displayable_string }
    puts "\n\n"

    puts "Due Today\n"
    puts all.select { |todo| todo.due_today }.map { |todo| todo.to_displayable_string }
    puts "\n\n"

    puts "Due Later\n"
    puts all.select { |todo| todo.due_later }.map { |todo| todo.to_displayable_string }
    puts "\n\n"
  end
end
