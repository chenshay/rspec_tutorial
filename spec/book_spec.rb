require 'spec_helper'

describe Book do

  before :each do
    @book = Book.new "Title", "Author", :category
  end

  describe "#new" do #book new should do what
    it 'returns a new book object' do
      @book.should be_an_instance_of Book
    end

    it 'throws an ArgumentError when given fewer than 3 parameters' do
      lambda { Book.new 'Title', 'Author' }.should raise_exception ArgumentError
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      @book.title.should == "Title"
    end

    it 'returns the correct author' do
      @book.author.should == "Author"
    end

    it 'returns the correct category' do
      @book.category.should == :category
    end
  end

end