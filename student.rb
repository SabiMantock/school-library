require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end

student = Student.new(16, 'Social', 'Alice')
puts student.name
puts student.age
puts student.classroom
