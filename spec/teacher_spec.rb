require_relative '../teacher'

describe Teacher do
  context 'Create a new teacher' do
    new_teacher = Teacher.new('Mr. Challenger', 37, 'Math')
    it 'Has a specialization' do
      expect(new_teacher.specialization).to eql 'Math'
    end
    it 'Has a name' do
      expect(new_teacher.name).to eql 'Mr. Challenger'
    end
    it 'Has an age' do
      expect(new_teacher.age).to eql 37
    end
    # it 'Is of type teacher' do
    #   expect(new_teacher.type).to eql 'Teacher'
    # end
    it 'Can use services' do
      expect(new_teacher.can_use_services?).to be true
    end
  end
end
