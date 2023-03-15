require 'spec_helper'

describe CapitalizeDecorator do
  describe '#initialize' do
    it 'should initialize the nameable attribute' do
      nameable = double('nameable')
      decorator = CapitalizeDecorator.new(nameable)

      expect(decorator.nameable).to eq nameable
    end
  end

  describe '#correct_name' do
    it 'should return the name in uppercase' do
      nameable = double('nameable')
      allow(nameable).to receive(:correct_name).and_return('john doe')

      decorator = CapitalizeDecorator.new(nameable)

      expect(decorator.correct_name).to eq 'John doe'
    end
  end
end
