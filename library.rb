class Library
  def initialize
    @books = []
    @borrowed_books = []
    @available_books = []
  end

  def books
	 @books
  end

  # This allows books to be added to the library
  def add_book(book)
     @books << book
  end

  # This method lists the entire library with the title and status of the book
 def list_books
	 if @books != []
    @books.each do |book|
		puts "Book Title: #{book.title} - Book Status: #{book.status}"
    end
   
   else                                       # Runs if we haven't added any books to the library
    puts "Sorry, we don't have any books in this library. You should add your favorites!"
   end
  end

  # This method lists all books in the library that have a status of "checked out" and who has them checked
  def borrowed_books
	   if @books.each {|book, user| puts "Book Title: #{book.title}, Checked Out By: #{book.borrower}" if book.status == "checked out"}
	   end
  end

  # This method lists all books in the library that have a status of "available"
  def available_books
  	if @books.each {|book| puts "Book Title: #{book.title}" if book.status == "available"}
    else
      puts "I'm sorry, all books are currently checked out"
	   end
  end

  # This method method allows a user to check out a book
  def check_out(user, book)
  	
    if user.borrowed_books_array.length == 2   # Checks to see if the user has 2 books already checked out
  		puts "Sorry, you've already checked out 2 books."
      return
    end

    if book.status == "checked out"            # Checks to see if the book is available to be checked out
      puts "Sorry, '#{book.title}' is already checked out"
      return
    end

  # If the user reachs this point in the method, they are able to check out the book         
    book.borrower = user.name
    book.status = "checked out"
    user.borrowed_books(book)
    puts "Thank you for checking out '#{book.title}'. We hope you enjoy!"
    return
  end
 
  def check_in(book)
	   if book.status == "checked out"           # Checks to make sure that the book is currently checked out
       book.borrower = []
       book.status = "available"
       puts "'#{book.title}'' is now checked in!"
       return
     else
      "'#{book.title}' has already been checked in"
     end
  end

end

# This class created the attributes of the user who will be checking out the books
class Borrower
    
    attr_accessor :borrowed_books_array
    attr_reader :name

  def initialize(name)
  	@name = name
  	@borrowed_books_array = []
  end
 
  def borrowed_books(book)                           # Adds the user's borrowed books to the book array list
    @borrowed_books_array << book
  end

  def borrowed_books_list                            # Lists the borrowed books of a sepecific user
	  @borrowed_books_array.each {|book| puts book.title}
  end
  
end

# This class creates the attributes of the book that will be added to the library
class Book
  
  attr_accessor :status, :borrower
  attr_reader :title, :author

  def initialize(title, author)
  	@title = title
  	@author = author
  	@status = "available"
  	@borrower = nil
  end
  
end