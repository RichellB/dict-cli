require "pry"

class CLI
  
  def run 
    puts "Welcome to Today's Best Sellers!"
    puts "Main Menu"
    Scraper.scrape_reviews
   
    Book.all.each.with_index(1) do |book, i|
      puts "#{i}: #{book.title}"
    end
    menu
  end
  
  def menu
    books = []
    puts "Please enter a book to get the full review:"
    input = gets.chomp
    title = Book.all[input.to_i-1]
    
    if !title 
      puts "This book is not on the list. Please enter a valid option."
      #menu 
    else 
      puts "Hi"
      Scraper.scrape_book_review(title)
    end
  end
end