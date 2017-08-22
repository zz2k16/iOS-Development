
class Vehicle {
	var currentSpeed = 0.0
	var description: String {
		return "travelling at \(currentSpeed) miles per hour"
	}
	func makeNoise(){
		// noise for vehicle types
	}
}

let someVehicle = Vehicle()

class Bicycle: Vehicle {
	var hasBasket = false
}

let trike = Bicycle()
trike.hasBasket = true
trike.currentSpeed = 3.2
trike.description

// overriding methods
class Train: Vehicle {
	
	override func makeNoise() {
		print("Choo Choo!")
	}
}

let train = Train()
train.makeNoise()

// overriding properties
class Car: Vehicle{
	
	var gear = 1
	override var description: String {
		return super.description + " in gear \(gear)"
	}
	
}

let golf = Car()
golf.currentSpeed = 60
golf.gear = 7
golf.description

// overriding property observers

class AutomaticCar: Car {
	
	override var currentSpeed: Double {
		didSet {
			if currentSpeed > 60 { gear = 7 }
			else {
				gear = Int(currentSpeed / 10.0) + 1
			}
		}
	}
}

let audi = AutomaticCar()
audi.currentSpeed = 60
audi.description


