class Book
  attr_accessor :title, :url
  
  @@all = []
  def initialize(title, url)
    @title = title
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end
end