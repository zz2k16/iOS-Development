//in-out function
func swapTwoInts(_ a: inout Int, _ b: inout Int){
     let tempA = a
     a = b
     b = tempA
}

var xa = 3
var xb = 100
//print("a is \(xa)")
//print("b is \(xb)")

swap(&xa, &xb)
//print("a is now \(xa)")
//print("b is now \(xb)")


// function types

func addTwoInts(_ a: Int, _ b: Int) -> Int { return a + b }
func timesTwoInts(_ a: Int, _ b: Int) -> Int {return a * b }

var addNums: (Int, Int) -> Int = addTwoInts

print(addNums(3,12))

var addTwo = addTwoInts

print(addTwo(10,4))

var multiTwo = timesTwoInts

print(multiTwo(4,16))

func printMathResult(_ mathFunc: (Int, Int) -> Int, _ a: Int, _ b: Int){
     print("Result: \(mathFunc(a,b))")
}

printMathResult(addTwo, 14, 4)
printMathResult(multiTwo, 20, 4)

func diviTwo(_ a: Int, _ b: Int) -> Int {return a / b }
var divy = diviTwo
printMathResult(diviTwo, 14, 2)
printMathResult(divy, 14, 2)

