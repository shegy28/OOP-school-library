require 'spec_helper'

describe Teacher do
  describe '#initialize' do
    it 'creates a new teacher instance with given age, name, and specialization' do
      teacher = Teacher.new(35, 'Math', 'John Doe')
      expect(teacher.age).to eq(35)
      expect(teacher.name).to eq('John Doe')
    end

    it 'sets parent permission to true by default' do
      teacher = Teacher.new(35, 'Math', 'John Doe')
      expect(teacher.parent_permission).to eq(true)
    end

    it 'creates a new teacher instance with given parent permission' do
      teacher = Teacher.new(35, 'Math', 'John Doe', parent_permission: false)
      expect(teacher.parent_permission).to eq(false)
    end
  end

  describe '#can_use_services?' do
    it 'returns true for any teacher instance' do
      teacher = Teacher.new(35, 'Math', 'John Doe')
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
