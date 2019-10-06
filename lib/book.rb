class Book
  attr_accessor :title, :url, :author, :book_name, :review
  @@all = []
  
  def initialize(title, url)
    @title = title
    @url = url
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end
end