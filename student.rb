require_relative './person'

class Student < Person
  attr_reader :classroom, :age, :parent_permission
  attr_accessor :type

  def initialize(age, classroom, name, parent_permission, type = 'Student')
    super(age, name, parent_permission)
    @classroom = classroom
    @type = type
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
    true
  end
end
