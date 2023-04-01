require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :type

  def initialize(name, age, specialization,  type = 'Teacher')
    super(name, age)
    @specialization = specialization
    @type = type
  end

  def can_use_services?
    true
  end
end
