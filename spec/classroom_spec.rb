require_relative '../classroom'
require_relative '../student'

describe Classroom do
  let(:classroom) { Classroom.new('Class1') }
  let(:student) { Student.new('Bill', 'Gates', 'Bill.Gates@example.com', '12345') }

  describe '#initialize' do
    it 'Sets the classroom name' do
      expect(classroom.label).to eq 'Class1'
    end

    it 'Initialize an empty list of students' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'Add a student to classroom' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'Sets the student classroom to the current classroom' do
      classroom.add_student(student)
      expect(student.classroom).to eq classroom
    end
  end
end