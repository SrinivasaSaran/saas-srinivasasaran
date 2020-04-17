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

def parse_dns(raw_dns)
  j = 0 # Iteration variable.
  k = 0 # Iteration variable.
  dns_data = {}
  for i in 0..raw_dns.length() - 1 # Here 'i' is index.
    if (raw_dns[i][0] == "A") # Checking for 'A record'.
      if (j == 0)
        dns_data[:a] = [] # Initializing key-value pair of 'A record'.
      end
      dns_data[:a] << raw_dns[i].strip.split(", ") # Storing key-value pair of 'A record'.
      j = j + 1
    elsif (raw_dns[i][0] == "C" && raw_dns[i][1] == "N") # Checking for 'CNAME record'.
      if (k == 0)
        dns_data[:cname] = [] # Initializing key-value pair of 'CNAME record'.
      end
      dns_data[:cname] << raw_dns[i].strip.split(", ") # Storing key-value pair of 'CNAME record'.
      k = k + 1
    end
    if (i == raw_dns.length() - 1 && j == 0 && k == 0) # Checking j and k values in last iteration.
      puts "The Zone file does not contain  'A record' or 'CNAME record'"
    end
  end
  return dns_data # Hash data of 'A record' and 'CNAME record'.
end

def resolve(dns_records_t, lookup_chain_t, domain_t) # _t stands for temperory variable of same name.
  for j in 0..dns_records_t[:a].length() - 1
    if (dns_records_t[:a][j][1] == domain_t) # Checking 'A record' for domain name match.
      lookup_chain_t.push(dns_records_t[:a][j][2])
      domain_t = dns_records_t[:a][j][2] # Updating Domain_t to prevent recursion.
    end
  end
  for i in 0..dns_records_t[:cname].length() - 1
    if (dns_records_t[:cname][i][1] == domain_t) # Checking 'CNAME record' for domain name match.
      domain_t = dns_records_t[:cname][i][2] # Updating Domain_t for recursion call.
      lookup_chain_t.push(dns_records_t[:cname][i][2]) # Appending DNS resolver route to print at last.
      resolve(dns_records_t, lookup_chain_t, domain_t) # Recursive call statement.
    elsif (dns_records_t[:cname][i][2] == domain_t) # Checking 'CNAME record' again for domain name match, to avoid cycles and infinite recursion.
      domain_t = dns_records_t[:cname][i][1] # Updating Domain_t for recursion call.
      lookup_chain_t.push(dns_records_t[:cname][i][1]) # Appending DNS resolver route to print at last.
      resolve(dns_records_t, lookup_chain_t, domain_t) # Recursive call statement.
    end
  end
  return lookup_chain_t # Returning array containing DNS resolver route for valid domain name.
end

count = 0 # count value to indicate whether to proceed with DNS resolver or not after analysing zone file content.
dns_records = parse_dns(dns_raw) # Call for 'A record' and 'CNAME record' separation from zone file.
puts dns_records
count = 1 if (dns_records == nil) # Checking whether zone file contains any 'A records' or 'CNAME records'.
if (count == 0) # Proceeding only when given zone file is valid.
  lookup_chain = [domain]
  lookup_chain = resolve(dns_records, lookup_chain, domain) # Calling DNS resolver algorithm.
  if (lookup_chain == [domain]) # Condition for invalid domain name.
    puts "Error: record not found for '#{lookup_chain[0]}'" # Print statement for invalid domain name.
  elsif (1)
    puts lookup_chain.join(" => ") # prints this on receiving valid domain name and valid zone file.
  end
end
