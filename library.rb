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
   else
    puts "Sorry, we don't have any books in this library. You should add your favorites!"
   end
  end

  # This method lists all books in the library that have a status of "checked out"

  def borrowed_books
	   @books.each do |book, user|
		    if book.status == "checked out"
		    	puts #{book.title}
        else
          return "All books are currently available"
		    end
	   end
  end

  # This method lists all books in the library that have a status of "available"

  def available_books
  	@books.each do |book|
  		if book.status == "available"
  			return "Book Title: #{book.title}"
      else
        puts "I'm sorry. All books are currently checked out"
  		end
	   end
  end

  
  def check_out(user, book)
  	
    if user.borrowed_books_array.length == 2   # Checks to see if the user has 2 books already checked out
  		puts "Sorry, you've already checked out 2 books."
      return
    end

    if book.status == "checked_out"            # Checks to see if the book is available to be checked out
      puts "Sorry, this book is already checked out"
      return
    end

      # If the user reachs this point in the method, they are able to check out the book         
      book.borrower = user
      book.status = "checked out"
      user.borrowed_books(book)
      return "Thank you for checking out #{book.title}. We hope you enjoy!"
    
  end

 
  def check_in(book)
	   if book.status == "checked out"       # Checks to make sure that the book is currently checked out
       book.borrower = []
       book.status = "available"
     else
      "That book has already been checked in"
     end
  end

end


class Borrower
    
    attr_accessor :borrowed_books_array

  def initialize(name)
  	@name = name
  	@borrowed_books_array = []
  end
 
  def borrowed_books(book)
      @borrowed_books_array << book
  end

  def name
	 @name
  end

  # def borrowed_books_list
	 # @books.each do |book|
  #   if book.borrower == user
  #     @borrowed_books << borrowed_books_list
  #   puts "You currently have these books check out: #{@borrowed_books}.join('Title:')"
  #   gitend
  #  end
  # end
  
end

class Book
  def initialize(title, author)
  	@title = title
  	@author = author
  	@status = "available"
  	@borrower = nil
  end
  
  def title
	 @title
  end
  
  def author
	 @author
  end
  
  def status
	 @status
  end
  
  def status=(new_value)
	 @status = new_value
  end
  
  def borrower
	 @borrower
  end
  
  def borrower=(new_value)
	 @borrower = new_value
  end
end