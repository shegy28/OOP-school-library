require 'spec_helper'

describe Student do
  let(:student) { described_class.new(17, 'John', true) }
  let(:classroom) { Classroom.new('Math') }

  describe '#initialize' do
    it 'sets the age, name, and parent_permission instance variables' do
      expect(student.age).to eq 17
      expect(student.name).to eq 'John'
      expect(student.parent_permission).to eq true
    end
  end

  describe '#play_hooky' do
    it 'returns the string ¯\(ツ)/¯' do
      expect(student.play_hooky).to eq '¯\(ツ)/¯'
    end
  end

  describe '#classroom=' do
    context 'when the student is not already in the classroom' do
      it 'adds the student to the classroom' do
        expect { student.classroom = classroom }.to change { classroom.students.size }.by(1)
        expect(classroom.students).to include(student)
      end
    end
  end
end
