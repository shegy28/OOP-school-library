require_relative './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age
  attr_reader :id, :rentals, :parent_permission

  def add_rentals(rental)
    @rentals << rental
  end

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || parent_permission
  end
  private :of_age?

  def to_h
    {
      age: @age,
      name: @name,
      parent_permission: @parent_permission,
      id: @id,
      rentals: @rentals.map(&:to_h)
    }
  end
  
end
