require 'spec_helper'

describe Classroom do
  let(:classroom) { Classroom.new('Math') }
  let(:student) { Student.new(16, 'Alice', true) }

  describe '#initialize' do
    it 'creates a new classroom with the given label' do
      expect(classroom.label).to eq('Math')
    end

    it 'creates an empty array of students' do
      expect(classroom.students).to eq([])
    end
  end

  describe '#add_student' do
    it 'adds the student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to eq([student])
    end

    it 'sets the classroom property on the student' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
