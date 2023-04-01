require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :type

  def initialize(age, name, specialization, type = 'Teacher')
    super(age, name)
    @specialization = specialization
    @type = type
  end

  def can_use_services?
    true
  end
end
