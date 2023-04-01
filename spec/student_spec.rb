require_relative '../student'
require_relative '../classroom'

describe Student do
  let(:classroom) { Classroom.new('Psychology') }
  let(:student) { Student.new(16, classroom, 'Tommy Hilfiger', parent_permission: true) }

  context 'Test students' do
    it 'Correct classroom' do
      expect(student.classroom).to eql classroom
    end

    it 'Play hooky' do
      expect(student.play_hooky).to eql '¯\\_(ツ)_/¯'
    end

    it 'Sets the classroom' do
      new_classroom = Classroom.new('Phsyics')
      expect(student.add_classroom(new_classroom)).to be true
      expect(student.classroom).to eql new_classroom
      expect(new_classroom.students.include?(student)).to be true
    end
  end
end
