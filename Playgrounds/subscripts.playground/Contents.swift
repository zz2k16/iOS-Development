struct TimesTable {
     let multiplier: Int
     subscript(index: Int) -> Int { return multiplier * index }
}

let threesTables = TimesTable(multiplier: 3)
threesTables[6]
let foursTables = TimesTable(multiplier: 4)
foursTables[4]

// matrix struct //
struct Matrix {
	
	let rows: Int, columns: Int
	var grid: [Double]
	init(rows: Int, columns: Int) {
		self.rows = rows
		self.columns = columns
		grid = Array(repeating: 0.0, count: rows * columns)
	}
	
	func indexIsValid(row:Int, column: Int) -> Bool {
		return row >= 0 && row < rows && column >= 0 && column < columns
	}
	
	subscript(row: Int, column: Int) -> Double {
		get {
			assert(indexIsValid(row: row, column: column), "Index out of range")
			return grid[(row * column) + column]
		}
		set {
			assert(indexIsValid(row: row, column: column), "Index out of range")
			grid[(row * columns) + column] = newValue
		}
	}
	
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 0] = 4.0
matrix[0, 1] = 0.40
matrix[1, 1] = 16.0
print(matrix)

