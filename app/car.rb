# => Relate this to tic tac toe
# => - one object is a component of the other object
# => e.g. a wheel is a component of a car or truck, but not a yacht
# => This is known as composition
# => Loosely coupled
# => highly cohesive
# => Player 
	# => persom
	# => computer
		# => @person = Person.new
		# => @computer = Computer.new
			# => Player.new(@person)
			# => Player.new(@computer)






require 'pry'
class Vehicle
	def wheels
		puts "go round"
	end
end
class Car
	def initialize
		puts "vroom"
	end
	def wheels
		[Wheel.new, Wheel.new]
	end
	
end
class Wheel
	def initialize
		puts "go round"
	end
end
class Yacht

end
class Truck < Vehicle
	
end
Pry.start