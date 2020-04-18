require "./connect_db.rb"
connect_db!

#"migration" - any command that modifies the structure of the database
ActiveRecord::Migration.create_table(:todos) do |t|
  t.column :todo_text, :text
  t.column :due_date, :date
  t.column :completed, :bool
end
