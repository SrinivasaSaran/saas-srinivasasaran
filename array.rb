#Problem 1
puts "program 1:"
names = [["Jhumpa", "Lahiri"], ["J. K", "Rowling"], ["Devdutt", "Pattanaik"]]
newnames = []
names.each {
  |c|
  newnames.push(c.join(" "))
}
puts newnames, "\n\nprogram 2:"

#problem 2
books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
books.map.with_index {
  |d, e|
  puts "#{d} is written by #{authors[e]}"
}

#problem 3
#Note: Have to redo this, as it is hardcoded..
todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]
todo = [["a", []], ["b", []], ["c", []]]
todos.each {
  |f|
  if f[1] == "money"
    todo[0][0] = f[1]
    todo[0][1].push(f[0])
  end
  if f[1] == "organize"
    todo[1][0] = f[1]
    todo[1][1].push(f[0])
  end
  if f[1] == "food"
    todo[2][0] = f[1]
    todo[2][1].push(f[0])
  end
}
puts "\nprogram 3:"
todo.each {
  |g|
  puts "#{g[0]}:\n"
  g[1].each { |h| puts "   #{h}" }
}
#Aliter:
=begin
money = todos.find_all { |l| l[1] == "money" }
puts "#{money[0][1]}:"
money.each { |zz| puts "    #{zz[0]}" }
organize = todos.find_all { |l| l[1] == "organize" }
puts "#{organize[0][1]}:"
organize.each { |zz| puts "    #{zz[0]}" }
food = todos.find_all { |l| l[1] == "food" }
puts "#{food[0][1]}:"
food.each { |zz| puts "    #{zz[0]}" }
=end
