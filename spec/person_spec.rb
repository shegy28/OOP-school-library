require 'spec_helper'

describe Person do
  let(:person) { Person.new(20, 'Alice', parent_permission: false) }

  describe '#initialize' do
    it 'creates a new Person object with the given age' do
      expect(person.age).to eq(20)
    end

    it 'creates a new Person object with the given name' do
      expect(person.name).to eq('Alice')
    end

    it 'creates a new Person object with parent permission' do
      expect(person.parent_permission).to be_falsey
    end

    it 'creates a new Person object with an ID between 1 and 1000' do
      expect(person.id).to be_between(1, 1000).inclusive
    end

    it 'creates a new Person object with an empty rentals list' do
      expect(person.rentals).to be_empty
    end
  end

  describe '#add_rentals' do
    it 'adds a rental to the person\'s list of rentals' do
      rental = double('rental')
      person.add_rentals(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe '#correct_name' do
    it 'returns the person\'s name' do
      expect(person.correct_name).to eq('Alice')
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is 18 or older' do
      expect(person.can_use_services?).to be_truthy
    end

    it 'returns true if the person is under 18 and has parent permission' do
      person = Person.new(17, parent_permission: true)
      expect(person.can_use_services?).to be_truthy
    end

    it 'returns false if the person is under 18 and does not have parent permission' do
      person = Person.new(17, parent_permission: false)
      expect(person.can_use_services?).to be_falsey
    end
  end
end
