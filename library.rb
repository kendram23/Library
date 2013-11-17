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
		    	puts "The following books are checked out #{book.title}"
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
  	if user.borrowed_books.length == 2
  		return "Sorry, you've already checked out 2 books."
  	elsif book.status == "available"
      book.borrower = user
      book.status = "checked out"
      return "Thank you for checking out this book."
    else
  		return "Sorry, this book is checked out already"
	   end
  end

 
  def check_in(book)
	   book.borrower = []
     book.status = "available"
  end

end


class Borrower
  def initialize(name)
  	@name = name
  	@borrowed_books = []
  end
 
  def borrowed_books
    @borrowed_books
  end

  def name
	 @name
  end

  def borrowed_books_list
	 @books.each do |book|
    if book.borrower == user
      @borrowed_books << borrowed_books_list
    puts "You currently have these books check out: #{@borrowed_books}.join('Title:')"
    end
   end
  end
  
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