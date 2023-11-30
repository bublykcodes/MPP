module Printable
  def print_info
    puts "Information about the object:"
    instance_variables.each do |var|
      puts "#{var}: #{instance_variable_get(var)}"
    end
  end
end

class MyClass
  def initialize(name, age)
    @name = name
    @age = age
  end

  def print_info
    Printable.print_info(self)
  end

  extend Printable  # Додаємо метод як метод класу
end

obj = MyClass.new("John", 25)
obj.print_info