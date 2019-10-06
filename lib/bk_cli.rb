require "pry"

class CLI
  
  def run 
    puts " "
    puts "Welcome to the reviews for Today's Best Sellers!"
    puts "Here is a list of the books on today's Best Sellers:"
    Scraper.scrape_reviews
   
    Book.all.each.with_index(1) do |book, i|
      puts "#{i}: #{book.title}"
    end
    menu
  end
  
  def menu
    books = []
    puts "Please enter a book to view Krikus' full review on it:"
    input = gets.chomp
    book = Book.all[input.to_i-1]
    
    if !book 
      puts "Sorry, this book is not on the list for today! Please enter a valid option from the list above."
      menu 
    else 
      Scraper.scrape_book_review(book)
      puts "Here are the review details for #{book.title}:"
      puts "*********************************************"
      puts "Book Name: #{book.book_name}"
      puts "Author: #{book.author}"
      puts "Kirkus Review: #{book.review}"
    end
  end
end