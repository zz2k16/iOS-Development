
struct Point {
     var x = 0.0, y = 0.0
}
struct Size {
     var width = 0.0, height = 0.0
}

struct Rect {
     var origin = Point()
     var size = Size()
     
     var center: Point{
          get{
               // return center point values by calculating from height of rect
               let centerX = origin.x + (size.width / 2)
               let centerY = origin.y + (size.height / 2)
               return Point(x: centerX, y: centerY)
          }
          set(newCenter){
               // setter to compute new origin based on new center
               // origin set by subtracting width and height from new centre point values
               origin.x = newCenter.x - (size.width / 2)
               origin.y = newCenter.y - (size.height / 2)
          }
     }
}

// define square from struct
var square = Rect(origin: Point(), size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center
print("The square is now at origin: \(square.origin.x), \(square.origin.y)")
print("The square is now at center: \(square.center.x), \(square.center.y)\n")

square.center = Point(x: 15.0, y: 15.0)
print("The square is now at origin: \(square.origin.x), \(square.origin.y)")
print("The square is now at center: \(square.center.x), \(square.center.y)\n")

// change size of rect to 5 x 5
square.size = Size(width: 5.0, height: 5.0)
square.center = Point(x: 5.0, y: 5.0)
print("The square is now at origin: \(square.origin.x), \(square.origin.y)")
print("The square is now at center: \(square.center.x), \(square.center.y)")

print("\n\n\n\n\n\n\n")

// read only computed properties
struct Cuboid {
     var width = 0.0, height = 0.0, depth = 0.0
     
     var volume: Double {
          return width * height * depth
     }
}
let twoByFour = Cuboid(width: 4, height: 2, depth: 2)
print("The volume is \(twoByFour.volume)")

// property observers

class StepCounter {
     
     var totalSteps: Int = 0 {
          willSet(newTotalSteps){
               print("About to set totalSteps to \(newTotalSteps)")
          }
          didSet(lastSteps){
               if totalSteps > lastSteps {
                    print("Added \(totalSteps - lastSteps) steps")
               }
          }
     }
     
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896
stepCounter.totalSteps = 896

// type properties

struct AudioChannel {
     
     static let thresholdLevel = 10
     static var maxInputAllChannels = 0
     
     var currentLevel: Int = 0 {
          didSet{
               if currentLevel > AudioChannel.thresholdLevel{
                    // if level exceeds threshold, set to 10
                    currentLevel = AudioChannel.thresholdLevel
               }
               if currentLevel > AudioChannel.maxInputAllChannels {
                    // if current level < 10 but > max of all channels, set to current value
                    AudioChannel.maxInputAllChannels = currentLevel
               }
          }
     }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 6
print(leftChannel.currentLevel)
print(AudioChannel.maxInputAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputAllChannels)


