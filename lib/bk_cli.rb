require "pry"

class CLI
  
  def run 
    puts "*****************************************************"
    puts "Welcome to the reviews for Today's Best Sellers!"
    puts "Here is a list of the books on today's Best Sellers:"
    puts " "
    Scraper.scrape_reviews unless !Book.all.empty?
   
    Book.all.each.with_index(1) do |book, i|
      puts "#{i}: #{book.title}"
    end
    menu
  end
  
  def menu
    puts "\nPlease enter a book to view Krikus' full review on it:"
    input = gets.chomp
    book = Book.all[input.to_i-1]
    
    if !book 
      puts "\nSorry, this book is not on the list for today! Please enter a valid option from the list below.\n\n"
      run
    else 
      Scraper.scrape_book_review(book)
      puts "Here are the review details for #{book.title}:"
      puts "*********************************************"
      puts "Book Name: #{book.book_name}"
      puts "Author: #{book.author}"
      puts "Kirkus Review: #{book.review}"
      puts "\nWould you like to see the review for another book or see more books? Please enter y for YES or n for NO:"
      user_input = gets.chomp
      if user_input == 'y'
        run
        elsif user_input == 'n'
          puts "\nThanks for viewing! Goodbye"
        else 
          puts "That was not a valid option. Let's try again.\n"
          run
        end
    end
  end
end