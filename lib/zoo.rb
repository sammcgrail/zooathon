class Zoo
  attr_reader :cages, :employees
  def initialize(name)
    @name = name
    @cages = []
    10.times do
      cages << Cage.new
    end
    @employees = []
  end

  def add_employee(employee)
    employees << employee
  end

  def add_animal(animal)
     cages.each do |cage|
       if cage.empty?
         cage.animal = animal
         return
       end
     end
     raise ZooAtCapacity
  end

  def visit
    greeting = ""
    @employees.each do |employee|
      greeting += employee.greet + "\n"
    end
    @cages.each do |cage|
      unless cage.empty?
        greeting += cage.animal.speak + "\n"
      end
    end
    return greeting
  end
end

class ZooAtCapacity < StandardError
end
