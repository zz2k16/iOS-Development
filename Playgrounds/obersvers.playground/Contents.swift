// property observers
class StepCounter {
	var totalSteps:Int = 0 {
		willSet(newTotalSteps){
			print("About to set totalSteps to: \(newTotalSteps)")}
		didSet{
			if totalSteps > oldValue {
				print("Added \(totalSteps - oldValue) steps")
			}
		}
	}
}

let steps = StepCounter()
steps.totalSteps = 200
steps.totalSteps = 200
steps.totalSteps = 300