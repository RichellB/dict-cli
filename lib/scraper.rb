class Scraper
#require "dict/cli/version"
require "open-uri"
require "nokogiri"
require "pry"
  
def self.scrape_reviews
  books = []
  kirkus_url = "https://www.kirkusreviews.com"
  
  html = open(kirkus_url)
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
 #puts books
  url = doc.css(".critics-picks-item-img-ctr a").attr("href").value
  books.each{|bookr| Book.new(bookr, url)}
 
  end
  
  def self.scrape_book_review(title)
    html = open(kirkus_url+title.url)
    doc = Nokogiri::HTML(html)
    binding.pry
  end
end