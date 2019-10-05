class Book
  attr_accessor :book_name
  
  @@all = []
  def initialize(book_name)
    @book_name = book_name
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end
end