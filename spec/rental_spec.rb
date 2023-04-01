require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  context 'Test Rental' do
    let(:book) { Book.new('Harry Potter', 'J.K Rowling') }
    let(:person) { Person.new('Jack Burn', 18, parent_permission:true) }
    let(:rental) { Rental.new('2023-01-01', book, person) }

    it 'Correct rental date' do
      expect(rental.date).to eql '2023-01-01'
    end

    it 'Correct rental book' do
      expect(rental.book).to eql book
    end

    it 'Correct rental person' do
      expect(rental.person).to eql person
    end

    it 'Correct book rentals' do
      expect(book.rentals).to include rental
    end

    it 'Correct person rentals' do
      expect(person.rentals).to include rental
    end
  end
end
