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

def parse_dns(raw)
  zone_hash = {} #To store zone file details as hash
  raw.map { |line| line.strip.split(", ") }.
    reject { |record| record.length < 3 or (record[0] != "CNAME" and record[0] != "A") }.
    each { |data| zone_hash[data[1]] = { :type => data[0], :target => data[2] } }

  puts "The Zone file does not contain  'A record' or 'CNAME record'" if zone_hash.empty?
  zone_hash
end

def resolve(records, lookup, domain)
  required_record = records[domain]
  if (!required_record)
    lookup = ["Error: Record not found for " + domain]
  elsif required_record[:type] == "CNAME"
    lookup << required_record[:target]
    resolve(records, lookup, required_record[:target])
  elsif required_record[:type] == "A"
    lookup << required_record[:target]
  else
    lookup = ["Invalid record type for " + domain]
  end
end

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
