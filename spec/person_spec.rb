require_relative '../person'
require_relative '../rental'

describe Person do
  describe '#initialize' do
    context 'name and age' do
      it 'Has a name and age' do
        person = Person.new(28, 'Bill')
        expect(person.name).to eq('Bill')
        expect(person.age).to eq(28)
      end

      it 'Unknown name by default' do
        person = Person.new(28)
        expect(person.name).to eq('Unknown')
      end

      it 'generates a random id between 1 and 1000' do
        person = Person.new(28)
        expect(person.id).to be_between(1, 1000).inclusive
      end
    end

    context 'services' do
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
    end

    context 'rentals' do
      let(:rental) { instance_double(Rental) }

      it 'adds a rental to their rentals list' do
        person = Person.new(28)
        allow(Rental).to receive(:new).and_return(rental)
        person.add_rental(rental)
        expect(person.rentals).to include(rental)
      end
    end
  end
end
