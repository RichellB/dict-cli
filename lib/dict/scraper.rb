class Scraper
#require "dict/cli/version"
require "open-uri"
require "nokogiri"
require "pry"
  
def self.scrape_reviews
  
  html = open("https://www.kirkusreviews.com")
  doc = Nokogiri::HTML(html)
   # binding.pry 
  book1 = doc.css(".cover-image")[0].values[2]
  books << book1
  book2 = doc.css(".cover-image")[1].values[2]
  books << book2
  book3 = doc.css(".cover-image")[2].values[2]
  books << book3
  book4 = doc.css(".cover-image")[3].values[2]
  books << book4
  book5 = doc.css(".cover-image")[4].values[2]
  books << book5
  book6 = doc.css(".cover-image")[5].values[2]
  books << book6
    #book7 = doc.css(".cover-image")[0].values[2]
    
  end