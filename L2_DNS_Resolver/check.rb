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
#raw_dns = dns_raw

def parse_dns(raw_dns)
  j = 0
  k = 0
  dns_data = {}
  for i in 0..raw_dns.length() - 1
    if (raw_dns[i][0] == "A")
      if (j == 0)
        dns_data[:a] = []
      end
      dns_data[:a] << raw_dns[i].strip.split(", ")
      j = j + 1
    elsif (raw_dns[i][0] == "C" && raw_dns[i][1] == "N")
      if (k == 0)
        dns_data[:cname] = []
      end
      dns_data[:cname] << raw_dns[i].strip.split(", ")
      k = k + 1
    end
    if (i == raw_dns.length() - 1 && j == 0 && k == 0)
      puts "The Zone file does not contain  'A record' or 'CNAME record'"
    end
  end
  return dns_data
end

def resolve(dns_records_t, lookup_chain_t, domain_t)
  for j in 0..dns_records_t[:a].length() - 1
    if (dns_records_t[:a][j][1] == domain_t)
      lookup_chain_t.push(dns_records_t[:a][j][2])
      domain_t = dns_records_t[:a][j][2]
      #puts lookup_chain_t
    end
  end
  for i in 0..dns_records_t[:cname].length() - 1
    if (dns_records_t[:cname][i][1] == domain_t)
      domain_t = dns_records_t[:cname][i][2]
      lookup_chain_t.push(dns_records_t[:cname][i][2])
      #puts lookup_chain_t
      resolve(dns_records_t, lookup_chain_t, domain_t)
    elsif (dns_records_t[:cname][i][2] == domain_t)
      domain_t = dns_records_t[:cname][i][1]
      lookup_chain_t.push(dns_records_t[:cname][i][1])
      #puts lookup_chain_t
      resolve(dns_records_t, lookup_chain_t, domain_t)
    end
  end
  return lookup_chain_t
end

dns_records = parse_dns(dns_raw)
#puts dns_records
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
#puts lookup_chain
if (lookup_chain == [domain])
  puts "Error: record not found for '#{lookup_chain[0]}'"
elsif (1)
  puts lookup_chain.join(" => ")
end
