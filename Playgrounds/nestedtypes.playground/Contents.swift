// nested types
// enums are often created to support a class or struct's functionality
// nested types allow for more complex types within classes and structs

// nested enum types inside a struct to model a black jack card game
struct BlackjackCard {
	
	// nested Suit enumeration
	enum Suit: Character {
		case spades = "♠︎", hearts = "❤", diamonds = "⬦", clubs = "♣︎"
	}
	
	// nested Rank enumeration
	enum Rank: Int{
		case two = 2, three, four, five, six, seven, eight, nine, ten
		case jack, queen, king, ace
		// nested struct
		struct Values {
			let first: Int, second: Int?
		}
		
		// blackjackcard computed property
		var values: Values {
			switch self {
			case .ace: return Values(first: 1, second: 11)
			case .jack, .queen, .king:
				return Values(first: 10, second: nil)
			default:
				return Values(first: self.rawValue, second: nil)
			}
		}
		
	}
	
	// blackjackcard properties and methods
	let rank: Rank, suit: Suit
	var description: String {
		var output = "suit is \(suit.rawValue)"
		output += " value is \(rank.values.first)"
		if let second = rank.values.second {
			output += " or \(second)"
		}
		return output
	}
	
}

let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print(theAceOfSpades.description)
let heartSymbol = BlackjackCard.Suit.hearts.rawValue
