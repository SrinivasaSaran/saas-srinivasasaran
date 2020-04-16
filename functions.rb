#program 1
def salute(name, greeting)
  namesplit = name.split
  "#{greeting.capitalize} Mr.#{namesplit.last}"
end

puts salute("Nelson Rolihlahla Mandela", "hello")
puts salute("Sir Alan Turing", "welcome")

=begin
#Novice
recipients = [
  ["Srinath"],
  ["Jadeja", "Kambli"],
  ["Sachin", "Sidhu", "Kumble"],
]

emails = recipients[0]
if emails.length == 1
  puts "Hello #{emails[0]}!"
elsif emails.length == 2
  puts "Hello #{emails[0]} and #{emails[1]}!"
elsif emails.length > 2
  puts "Hello #{emails[0..-2].join(", ")}, and #{emails.last}!"
end

emails = recipients[1]
if emails.length == 1
  puts "Hello #{emails[0]}!"
elsif emails.length == 2
  puts "Hello #{emails[0]} and #{emails[1]}!"
elsif emails.length > 2
  puts "Hello #{emails[0..-2].join(", ")}, and #{emails.last}!"
end

emails = recipients[2]
if emails.length == 1
  puts "Hello #{emails[0]}!"
elsif emails.length == 2
  puts "Hello #{emails[0]} and #{emails[1]}!"
elsif emails.length > 2
  puts "Hello #{emails[0..-2].join(", ")}, and #{emails.last}!"
end

#Pro
recipients = [
  ["Srinath"],
  ["Jadeja", "Kambli"],
  ["Sachin", "Sidhu", "Kumble"],
]

recipients.each do |emails|
  if emails.length == 1
    puts "Hello #{emails[0]}!"
  elsif emails.length == 2
    puts "Hello #{emails[0]} and #{emails[1]}!"
  elsif emails.length > 2
    puts "Hello #{emails[0..-2].join(", ")}, and #{emails.last}!"
  end
end

#Expert
def generate_salutation(emails)
  if emails.length == 1
    "Hello #{emails[0]}!"
  elsif emails.length == 2
    "Hello #{emails[0]} and #{emails[1]}!"
  elsif emails.length > 2
    "Hello #{emails[0..-2].join(", ")}, and #{emails.last}!"
  end
end

recipients = [
  ["Srinath"],
  ["Jadeja", "Kambli"],
  ["Sachin", "Sidhu", "Kumble"],
]

recipients.each do |emails|
  puts generate_salutation(emails)
end


=end
