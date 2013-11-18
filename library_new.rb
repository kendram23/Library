class Book(title, author, year_published)

	@@filepath = nil
	def self.filepath=(path=nil)
		@@filepath = File.join(APP_ROOT, path)
	end
	
	attr_accessor: :title, :author, :status = "available", :borrower = nil, year_published

	def self.file_exists?  # class should know if the book exists
		if @@filepath && File.exists?(@@filepath)  # had it been set and is it there?
			return true
		else
			return false
		end
	end

	def self.file_usable?
		return false unless @@filepath
		return false unless File.exists?(@@filepath)
		return false unless File.readable? (@@filepath)
		return false unless File.writable? (@@filepath)
		return true
	end

	def self.saved_books
		books = []
		if file_usable?
			file = File.new(@@filepath, 'r')
			file.each_line do |line|
				books << Book.new.import_line(line.chomp)
			end
			file.close
		end
	end

	# This add the books to the txt file library

	def self.build_library
		args = {}
		print "Book Name: "
		args[:name] = gets.chomp.strip

		print "Author's Name: "
		args[:author] = gets.chomp.strip

		print "Year Published"
		arg[:year_published]

		return self.new(args)
	end

	def initialize
		@title = args[:title]                    || ""
		@author = args[:author]                  || ""
		@year_published = args[:year_published]  || ""
		@status = :status                        || ""
		@borrower = :borrower					 || ""
	end

	def import_line(line)
		line_array = line.split("\t")
		@title, @author, @year_published, @status, @borrower
		return self
	end

	def save     #instance method
		return false unless Library.file_usable?
		File.open(@@filepath, 'a') do |file|   # puts pointer at the end of the file
			file.puts "#{[@title, @author, @year_published, @status, @borrower].join("\t")}\n"
		end

		return true
	end

end

# if user_input.downcase == "add"
# 	puts "Great! Let's get the information for your book! First things, first: What is the title of your book"
# 		book_title.upcase = gets.chomp
# 	puts "Who is the author of this book"
# 		book_author.upcase = gets.chomp
# 	puts "What year was this book published?"
# 		book_published = gets.chomp
# else
# 	puts "I'm sorry. That is not one of the choices. Would you like to 'Add' , 'Check Out', or 'Check In' a book?"
# 	user_input = gets.chomp
# end



# if else statement -- once it exits the if else statement it will exit -- would use a while loop to get it to work

# 	1. print the menu
# 	2. collect user user
# 	3. match to case statement
# 	4. go back to user menu --  while the input is not 6, execute command
# 	5. collect user input again
# 	6. exit the while loop and add a message