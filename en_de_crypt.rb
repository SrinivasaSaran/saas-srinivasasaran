require "aes"

source_file = ARGV[0]
password = ARGV[1]
encrypted = AES.encrypt(File.read(source_file), password)
#puts encrypted

target_file = "#{source_file}.enc"
File.open(target_file, "wb") { |f|
  f.write(encrypted, "\nyou won't find it \n")
  #f.delete(target_file)
}

decrypted = AES.decrypt(encrypted, password)
#puts decrypted

File.open(target_file, "a+") { |f| f.write("\n", decrypted) }

#online learn
=begin
key = AES.key
ciphered = AES.encrypt("You won't know what it is ;)", key)
puts ciphered
deciphered = AES.decrypt(ciphered, key)
puts deciphered
=end
