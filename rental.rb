class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.add_rental(self)
    @person = person
    person.add_rental(self)

    # @book.rentals << self
    # person.add_rental(self, date)
    # book.add_rental(person, date)
  end
end