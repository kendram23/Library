class Library
  def initialize
    @books = []
  end

  def books
  end

  def list_books
  end

  def borrowed_books
  end

  def available_books
  end

  def add_book(book)
  end

  def check_out(user, book)
  end

  def check_in(book)
  end
end

class Borrower
  def initialize(name)
  end

  def borrowed_books
  end

  def name
  end

  def borrowed_books_count
  end

  def borrowed_books_list
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















# class Library
  # def initialize
    # @books = []
  # end

  # def books
	
  # end

  # def list_books
	# @books = Book.new
  # end

  # def borrowed_books
  # end

  # def available_books
  # end

  # def add_book(book)
  # end

  # def check_out(user, book)
	# # if borrowed_books_count == 2
		# # puts "Sorry you must first check in a book before you can check out another book"
	# # else
		# # puts "Congratulations! You've checked out #{books}"
	# # end
  # end

  # def check_in(book)
  # end
# end

# class Borrower
  # def initialize(name)
	# @name = name
	# @books = []
	# list_books = 0
  # end

  # def borrowed_books
  # end

  # def name
  # end

  # def borrowed_books_count
  # end

  # def borrowed_books_list
  # end
# end

# class Book
  # def initialize(title, author)
	# @title = title
	# @author = author
  # end
# end
