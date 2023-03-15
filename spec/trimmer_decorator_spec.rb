require 'spec_helper'

describe TrimmerDecorator do
  let(:person) { Person.new(18, 'John Doe') }
  let(:decorator) { TrimmerDecorator.new(person) }

  describe '#correct_name' do
    context 'when the name is longer than 10 characters' do
      it 'should return a trimmed version of the name' do
        person.name = 'This is a very long name'
        expect(decorator.correct_name).to eq('This is a ')
      end
    end

    context 'when the name is shorter than or equal to 10 characters' do
      it 'should return the original name' do
        person.name = 'John Doe'
        expect(decorator.correct_name).to eq('John Doe')
      end
    end
  end

  describe '#initialize' do
    it 'should set the nameable attribute to the input object' do
      expect(decorator.nameable).to eq(person)
    end
  end
end
