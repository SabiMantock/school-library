require_relative '../person'

describe Person do
  context 'Create a person' do
    it 'Has a name and age' do
      person = Person.new(25, 'Bill')
      expect(person.name).to eq('Bill')
      expect(person.age).to eq(28)
    end

    it 'Unknown name by default' do
      person = Person.new(28)
      expect(person.name).to eq('Unknown')
    end

    it 'can use services if of age' do
      person = Person.new(28)
      expect(person.can_use_services?).to be_truthy
    end

    it 'Uses services if parent permission is given' do
      person = Person.new(10, 'Bob', true)
      expect(person.can_use_services?).to be_truthy
    end

    it 'cannot use services without parent permission if underage' do
      person = Person.new(10, 'Bob', false)
      expect(person.can_use_services?).to be_falsey
    end

    it 'generates a random id between 1 and 1000' do
      person = Person.new(28)
      expect(person.id).to be_between(1, 1000).inclusive
    end

    it 'adds a rental to their rentals list' do
      person = Person.new(28)
      book = double('book')
      rental = double('rental')
      allow(Rental).to receive(:new).and_return(rental)
      person.add_rental('2023-07-07', book)
      expect(person.rentals).to include(rental)
    end
  end
end
