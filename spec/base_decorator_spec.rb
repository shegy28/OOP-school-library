require 'spec_helper'

describe Decorator do
  describe '#initialize' do
    it 'should set the nameable attribute to the provided object' do
      obj = double('Nameable')
      decorator = Decorator.new(obj)
      expect(decorator.nameable).to eq obj
    end
  end

  describe '#nameable' do
    it 'should return the nameable object' do
      obj = double('Nameable')
      decorator = Decorator.new(obj)
      expect(decorator.nameable).to eq obj
    end
  end

  describe '#nameable=' do
    it 'should set the nameable object to the provided object' do
      obj1 = double('Nameable1')
      obj2 = double('Nameable2')
      decorator = Decorator.new(obj1)
      decorator.nameable = obj2
      expect(decorator.nameable).to eq obj2
    end
  end

  describe '#correct_name' do
    it 'should return the correct name from the nameable object' do
      obj = double('Nameable')
      allow(obj).to receive(:correct_name).and_return('John Doe')
      decorator = Decorator.new(obj)
      expect(decorator.correct_name).to eq 'John Doe'
    end
  end
end
