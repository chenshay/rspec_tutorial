require 'spec_helper'

describe 'Library Object' do

  before :all do
    lib_arr = [
        Book.new("Javascript", "Book Author", :development),
        Book.new("Design", "Book Author", :design),
        Book.new("Usability", "Book Author", :usability),
        Book.new("Development", "Book Author", :development),
        Book.new("Design 2", "Book Author", :design)
    ]

    File.open "books.yml", "w" do |f|
      f.write YAML::dump lib_arr
    end
  end

  before :each do
    @lib = Library.new "books.yml"
  end

  describe "#new" do
    context 'with no parameters' do
      it 'has no books' do
        lib = Library.new
        lib.should have(0).books
      end
    end

    context 'with a yaml file name parameter' do
      it 'has five books' do
        @lib.should have(5).books
      end
    end
  end

  it 'returns all the books in a given catogory' do
    @lib.get_books_in_category(:development).length.should == 2
  end

  it 'accepts new books' do
    @lib.add_book(Book.new("new book", "new author", :design))
    @lib.get_book("new book").should be_an_instance_of Book
  end

  it 'saves the library' do
    books = @lib.books.map { |book| book.title }
    @lib.save "new_library.yml"
    lib2 = Library.new "new_library.yml"
    books2 = lib2.books.map { |book| book.title }
    books.should eql books2
  end

end