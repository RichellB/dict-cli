class Scraper
require "open-uri"
require "nokogiri"
require "pry"

KIRKUS_URL = "https://www.kirkusreviews.com"
  
  def self.scrape_reviews
  
    html = open(KIRKUS_URL)
    doc = Nokogiri::HTML(html)
    
    book_nodes = doc.css(".critics-picks-item-ctr")
    book_nodes.each do |book_node|
      title = book_node.css('.cover-image').first.values[2]
      title = title.split('Cover art for ').last
      url = book_node.css('a').attr('href').value
      Book.new(title, url )
    end
  end
  
  def self.scrape_book_review(book)
    
    html = open(KIRKUS_URL+book.url)
    doc = Nokogiri::HTML(html)
    book.book_name = doc.css(".book_detail_title span").text
    book.author = doc.css(".book-author.clearfix span")[0].text
    book.review = doc.css(".book-review-txt p").text.split(/[\n,]/).join(" ")
    
  end
end