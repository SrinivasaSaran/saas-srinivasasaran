#1
#fileobject = File.new("filename.txt", "mode")
#fileobject.syswrite("Text to write into the file")
#fileobject.close()

# File Handling Program

# Creating a file
fileobject = File.new("sample.txt", "w+")

# Writing to the file
fileobject.syswrite("File Handling")

# Closing a file
fileobject.close()

#2
#fileobject = File.new("filename.txt", "r")
#fileobject.sysread(20)
#fileobject.close()

# File Handling Program

# Opening a file
fileobject = File.open("sample.txt", "r")

# Reading the first n characters from a file
puts(fileobject.sysread(21))

# Closing a file
fileobject.close()

# Opening a file
fileobject = File.open("sample.txt", "r")

# Read the values as an array of lines
print(fileobject.readlines)
puts

# Closing a file
fileobject.close()

# Opening a file
fileobject = File.open("sample.txt", "r")

# Read the entire content from a file
print(fileobject.read())

# Closing a file
fileobject.close()

#3
# Rename the file name
puts
puts File.rename("sample.txt", "newSample.txt") # 0 if renames, else 1

# Checking the old filename is existing or not
puts File.file?("sample.txt")

# Checking the renamed file is exiting or not
puts File.file?("newSample.txt")

# Checking the file have read permission
puts File.readable?("newSample.txt")

# Checking the file have write permission
puts File.writable?("newSample.txt")

# Delete the existing file
puts File.delete("newSample.txt")	 # 1 if deleted, else 0
