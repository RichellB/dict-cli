class Scraper
#require "dict/cli/version"
require "open-uri"
require "nokogiri"
require "pry"

KIRKUS_URL = "https://www.kirkusreviews.com"
  
def self.scrape_reviews
  books = []
  
  html = open(KIRKUS_URL)
  doc = Nokogiri::HTML(html)
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
  url = doc.css(".critics-picks-item-img-ctr a").attr("href").value
  puts url
  
  books.map{|bookr, i| Book.new(bookr, url)}
 
  end
  
  def self.scrape_book_review(book)
    
    html = open(KIRKUS_URL+book.url)
    doc = Nokogiri::HTML(html)
    book.book_name = doc.css(".book_detail_title").text
    book.author = doc.css(".book-author.clearfix").text.split(/[\n,]/)[5].strip
    book.review = doc.css(".book-review-txt").text.split(/[\n,]/).join(" ")
    
  end
end