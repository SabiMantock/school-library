require_relative '../student'
require_relative '../classroom'

describe Student do
  let(:classroom) { Classroom.new('Psychology') }
  let(:student) { Student.new(classroom, 16, 'Tommy Hilfiger', true) }

  context 'Testr students' do
    it 'Correct classroom' do
      expect(student.classroom).to eql classroom
    end

    it 'Play hooky' do
      expect(student.play_hooky).to eql '¯(ツ)/¯'
    end

    it 'Sets the classroom' do
      new_classroom = Classroom.new('Phsyics')
      student.classroom = new_classroom
      expect(student.classroom).to eql new_classroom
      expect(new_classroom.students.include?(student)).to be true
    end
  end
end