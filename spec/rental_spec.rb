require 'spec_helper'

describe Rental do
  describe '#initialize' do
    it 'should set the date, book, and person' do
      book = { 'title' => 'The Great Gatsby', 'author' => 'F. Scott Fitzgerald', 'rentals' => [] }
      person = { 'name' => 'John Doe', 'age' => 25, 'parent_permission' => true, 'rentals' => [] }
      date = '2022-01-01'
      rental = Rental.new(date, book, person)

      expect(rental.date).to eq date
      expect(rental.book).to eq book
      expect(rental.person).to eq person
    end

    it 'should add the rental to the book and person rentals' do
      book = { 'title' => 'The Great Gatsby', 'author' => 'F. Scott Fitzgerald', 'rentals' => [] }
      person = { 'name' => 'John Doe', 'age' => 25, 'parent_permission' => true, 'rentals' => [] }
      date = '2022-01-01'
      rental = Rental.new(date, book, person)

      expect(book['rentals'].last).to eq rental
      expect(person['rentals'].last).to eq rental
    end
  end
end
