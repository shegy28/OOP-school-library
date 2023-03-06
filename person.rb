class Person
  def initialize(age, name = 'Unknown', _parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  attr_accessor :name, :age
  attr_reader :id

  def is_of_age?
    @age >= 18
  end

  def can_use_services?
    is_of_age? || parent_permission?
  end
  private :is_of_age?
end
