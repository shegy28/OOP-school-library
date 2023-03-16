require 'spec_helper'

describe Book do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }

  describe '#initialize' do
    it 'should set the title and author' do
      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
    end

    it 'should initialize an empty array of rentals' do
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'should add the rental to the rentals array' do
      book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
      rental = { date: '2022-01-01', book: book.to_h, person: { name: 'John Doe', email: 'johndoe@example.com' } }

      expect do
        book.add_rental(rental)
      end.to change { book.rentals.length }.by(1)

      expect(book.rentals.last).to eq rental
    end
  end
end
