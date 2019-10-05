#require "dict/cli/version"
require "open-uri"
require "nokogiri"
require "pry"

def run 
    puts "Welcome to Today's Best Sellers!"
    puts "Main Menu"
    puts "Please enter a book to get the full review:"
  
    html = open("https://www.kirkusreviews.com")
    doc = Nokogiri::HTML(html)
    binding.pry 
end