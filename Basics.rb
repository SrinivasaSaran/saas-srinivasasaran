#Basics
integer = 69
string = "elaborate"
boolean = true
array = ["hello", 1, 2, 3, "hell_o"]
float = 56.983467928950
multiplication = integer * float
print multiplication
array.each do |i|
  puts i
end
["noquotes", 5, 7, "maybe"].each do |y| puts y end
puts boolean
print string + "string" + (integer + float).to_s + "\n"
print (integer + float)
print "\rhey there #{integer / float}"
print "\nhey there #{integer}/#{float} = #{integer / float}\n"
q = 5.to_f / 2
puts q
print string, " string ", (integer + float), "\n"
print "\n\n\n"

#Arrays
ary = [1, 3, 5, 7, 9, 2, 4, 6, 8]
puts ary.sum, ary.length, ary[4], ary.min & ary.max, ary[3 * 2], ary[3 & 2]

#Strings
str = "heY duDe hoe U doing Yaar?"
puts str.capitalize, str, str.upcase, str.downcase, str.length, str, str[15]
inn = gets.downcase
in1 = gets.to_i
puts inn * 3, in1 * 3
#puts str.titleize
BEGIN { puts "hello123" }
END { puts "subham:)" }
