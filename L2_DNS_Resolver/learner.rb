=begin
#ARGV = ["--verbose", "zone"]
#option = ARGV.shift
puts ARGF.argv
#ARGV.replace ["zone"]
puts ARGV
#puts ARGF.filename
#ARGF.close
puts ARGF.closed?
#puts ARGF.read
#puts ARGF.bytes.to_a
#puts ARGF.each_char.to_a
#puts ARGF.each_codepoint.to_a
puts ARGF.eof?
puts ARGF.external_encoding
puts ARGF.internal_encoding
ARGF.each_line() do |line|
  puts ARGF.filename if ARGF.lineno == 1
  puts "#{ARGF.lineno}: #{line}"
  #puts ARGF.eof?
end
puts ARGF.closed?
puts ARGF.binmode?
puts ARGV
puts ARGF.filename
ARGF.close
puts ARGF.filename
=end
def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")
#puts domain, dns_raw

def parse_dns(raw)
  h = {}
  #a = raw.reject { |line| line.empty? }
  #puts a
  b = raw.map { |line| line.strip.split(", ") }
  #a = b.each { |k| puts k.length }
  c = b.reject { |record| record.length < 3 or (record[0] != "CNAME" and record[0] != "A") }
  d = c.each { |data| h[data[1]] = { :type => data[0], :target => data[2] } }
  puts "The Zone file does not contain  'A record' or 'CNAME record'" if h.empty?
  #puts h.empty?
  h
end

def resolve(records, lookup, domain)
  required_record = records[domain]
  if (!required_record)
    lookup = ["Error: Record not found for " + domain]
    #puts lookup
    #return
  elsif required_record[:type] == "CNAME"
    lookup << required_record[:target]
    resolve(records, lookup, required_record[:target])
  elsif required_record[:type] == "A"
    lookup << required_record[:target]
  else
    lookup = ["Invalid record type for " + domain]
    #return
  end
end

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
#abc = dns_records[domain]
#puts !abc
puts dns_records
puts dns_records[domain]
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
