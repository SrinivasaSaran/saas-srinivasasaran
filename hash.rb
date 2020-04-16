#problem 1
books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
hash = {}
authors.map.with_index {
  |a, b|
  s = a.downcase.split
  hash[s[0].to_sym] = [books[b]]
}
puts "#{hash}\n\n"

#problem 2
todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
  ["Take pills", "health"],
]
todohash = {}
array = []
todos.each { |c|
  bool = array.detect { |w| w == c[1] }
  if bool == nil
    todohash[c[1].to_sym] = [c[0]]
    array.push(c[1])
  else
    todohash[c[1].to_sym] << c[0]
  end
}
puts todohash
