// initialization
struct Celcius {
	
	var tempInC: Double
	
	init(fromFahrenheit fahrenheit: Double) {
		tempInC = (fahrenheit - 32.0) / 1.8
	}
	
	init(fromKelvin kelvin: Double) {
		tempInC = kelvin - 273.15
	}
	
	init(_ celcius: Double) {
		tempInC = celcius
	}
	
}

struct Fahrenheit {
	
	var tempInFahrenheit: Double
	
	init(fromTempInC celcius: Double) {
		tempInFahrenheit = (celcius * 1.8) + 32.0
	}
}

let boilingPointWaterF = Celcius(fromFahrenheit: 212.0)
let freezingPointWaterK = Celcius(fromKelvin: 273.15)

let boilingWaterF = Fahrenheit(fromTempInC: 100)

let cloudy = Fahrenheit(fromTempInC: 17)
let cloudyUSA = Celcius(fromFahrenheit: 62.6)

// param names and argument labels

struct Color {
	
	let red, green, blue: Double
	
	init(red: Double, green: Double, blue: Double) {
		self.red = red
		self.green = green
		self.blue = blue
	}
	
	init(white: Double) {
		red = white
		green = white
		blue = white
	}
	
}

// initializer delegation
struct Size { var width = 0.0, height = 0.0 }
struct Point { var x = 0.0, y = 0.0 }

struct Rect {
	
	var origin = Point()
	var size = Size()
	var topLeft: Point {
		let topX = origin.x + size.height
		let topY = origin.y + size.height
		return Point(x: topX, y: topY)
	}
	
	init() {}
	
	init(origin: Point, size: Size) {
		self.origin = origin
		self.size = size
	}
	
	init(center: Point, size: Size){
		let originX = center.x - (size.width / 2)
		let originY = center.y - (size.height / 2)
		self.init(origin: Point(x: originX, y: originY), size: size)
	}
	
	
	
}

let basicRect = Rect()

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
centerRect.topLeft

// designated and convenience initializers //
// base class
class Food {
	
	var name: String
	init(name: String){ self.name = name }
	convenience init(){ self.init(name: "[Unnamed]") }
	
}
// designated initialiser
let namedMeat = Food(name: "Beef")
// convenience initialiser
let mysteryMeat = Food()

// subclass of Food with override convenience init and custom designated init
class RecipeIngredient: Food {
	
	var quantity: Int
	init(name: String, quantity: Int){
		self.quantity = quantity
		// initialise superclass designated init
		super.init(name: name)
	}
	override convenience init(name: String){
		// overides superclass convenience init for name param
		// convenience init delegates across to designated init to provide default stored property value of quantity
		self.init(name: name, quantity: 1)
	}
	
}

// inherited init()from Food with convenience init from RecipeIngredient which uses default init value for quantity
let oneMysteryItem = RecipeIngredient()
// using overridden convenience init passed across to designated init(name:) providing default qunatity value
let oneBeef = RecipeIngredient(name: "Beef")
// using customised designated init
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

// last subclass that inherits all of super class init() both convenience and designated
// because all properties are given default values, no inits are defined
class ShoppingListItems: RecipeIngredient {
	var purchased = false
	var description: String {
		var output = "\(quantity) x \(name)"
		output += purchased ? " ✔︎" : " ✘"
		return output
	}
}

var breakfastList = [
	ShoppingListItems(),
	ShoppingListItems(name: "Milk"),
	ShoppingListItems(name: "Banana", quantity: 4),
	ShoppingListItems()
]

breakfastList[0].name = "Orange Juice"
breakfastList[0].purchased = true
// for item in breakfastList { print(item.description) }

// failable initialisers //

struct Animal {
	let species: String
	init?(species: String) {
		if species.isEmpty {return nil }
		self.species = species
	}
}

let someCreatures = Animal(species: "Lion")
if let lion = someCreatures {
	print("This animal is \(lion.species)")
}

let mysteryAnimal = Animal(species: "")
if mysteryAnimal == nil {
	print("animal not initialised")
}

// failable enum cases 
enum TemperatureUnit {
	
	case celcius, kelvin, fahrenheit
	
	init?(symbol: Character){
		switch symbol {
		case "C":
			self = .celcius
		case "K":
			self = .kelvin
		case "F":
			self = .fahrenheit
		default:
			return nil
			
		}
	}
	
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil { print("Fahrenheit initialised!") }

// using raw values for failable init in enums
// uses init?(rawValue:) for failable init
enum TempUnits: Character {
	case celcius = "C", kelvin = "K", fahrenheit = "F"
}

// failable initialisers for class inheritence

class Product {
	let name: String
	
	init?(name: String){
		if name.isEmpty {return nil} // failable init if name not provicded
		self.name = name
	}
}

class CartItem: Product {
	let quantity: Int
	
	init?(name: String, qunatity: Int){
		if qunatity < 1 {return nil } // checks for qunatity and fails initialisation completely
		self.quantity = qunatity
		super.init(name: name) // initialises super class init before modifying name constant
	}
}

// succesful init of cart item
if let twoSocks = CartItem(name: "sock", qunatity: 2) {
	print("\(twoSocks.quantity) \(twoSocks.name)s added to the cart!")
}
// failable init of cart item
if let zeroShirts = CartItem(name: "shirt", qunatity: 0) {
	print("\(zeroShirts.quantity) \(zeroShirts.quantity)added to the cart")
} else { print("unable to init shirts") }


// overriding failable inits in class inheritence
class Document {
	var name: String?
	// init creates a document with nil name value
	init() {}
	// failable init creates a document with non empty name value
	init?(name: String) {
		if name.isEmpty {return nil}
		self.name = name
	}
}

// subclass with non failable initialiser
class AutoNamedDoc: Document {
	
	// overide empty designated init
	override init() {
		super.init()
		self.name = "[Untitled]"
	}
	// override non empty super class init
	override init(name: String) {
		super.init()
		if name.isEmpty {
			self.name = "[Untitled]"
		} else {
			self.name = name
		}
	}
	
}


// default stored property values using closures on init
struct Chessboard {
	
	// property value with closure
	let boardColours: [Bool] = {
		var temporaryBoard = [Bool]()
		var isBlack = false
		
		for i in 1...8 {
			for k in 1...8 {
				temporaryBoard.append(isBlack)
				isBlack = !isBlack
			}
			isBlack = !isBlack
		}
		return temporaryBoard
	}()
	
	func squareIsBlackAt(row: Int, column: Int) -> Bool {
		return boardColours[(row * 8) + column]
	}
	
}

let board = Chessboard()



