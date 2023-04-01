require 'json'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.add_rental(self)
    @person = person
    person.add_rental(self)

    @book.rentals << self
    person.add_rental(self, date)
    book.add_rental(person, date)
  end

  def to_json
    {
      date: @date,
      book_id: @book.id,
      person_id: @person.id
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    date = data['date']
    book = Library.find_book_by_id(data['book_id'])
    person = Library.find_person_by_id(data['person_id'])
    Rental.new(date, book, person)
  end
end
