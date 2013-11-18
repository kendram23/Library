require_relative "library_new.rb"

class Guide
	class Config
		@@actions = ['add', 'check out', 'check in']
		def self.actions; @@actions;
		end
	end

	def initialize   # takes a path and tries to find a file located at that path, if it can't
		# locate the library text file at that path
		Library.filepath = path
		if Library.file_usable?
			puts "Found library"
		# or create a new file
		elsif Library.create_file
			puts "Created library"
		else
			puts "Exiting... \n\n"
			exit! # will take this back to the command line
		end
	end

	def launch!
		introduction
		# action loop
		result = nil
		until result == :quit   # will repeat until the user quits
			# what do you want to do? (add, check out, check in, quit)
			action = get_action
			result = do_action(action)
		end
		conclusion
	end

	def get_action  # Keep asking for user input until we get a valid action
		action = nil
		until Guide::Config.actions.include?(action)
			puts "Actions: " + Guide::Config.actions.join(" ,") if action
			print "> "
			user_response = gets.chomp
			action = user_response.downcase.strip
		end
		return action
	end

	def do_action(action)
		case action
		when 'add'
			add
		when 'check out'
			check_out
		when 'check in'
			check_in
		when 'quit'
			return :quit
		else
			puts "\nI don't understand that command"
		end
	end

	def add
		output_action_header("Add a supplier")
			book = Library_new.build_library
			
			if library.save
				puts "\nBook added\n\n"
			else
				puts "\nSave Error: Book not added\n\n"
			end
		end
			
	def introduction
		puts "\n\n << Welcome to Kendra's Library!"
		puts "Our library has an abondance of books for you to choose from. So let's get started"
		puts " What would you like to do: " Guide::Config.actions.join(" ,")

	end

	def conclusion
		"\n Thank you for visiting the library today. We hope to see you soon!"
	end

end




# puts "Welcome to Kendra's library, where we have an abondance of books for you to read!

# What would you like to do today:
# 'Add' a book?
# 'Check Out' a book?
# 'Check In' a book"
