class Book
  attr_accessor :title, :author, :category

  def initialize title, author, category
    @title = title
    @author = author
    @category = category
  end

  def title
    @title
  end
end