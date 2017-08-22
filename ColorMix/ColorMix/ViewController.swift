//
//  ViewController.swift
//  ColorMix
//
//  Created by Mohammad Farrukh on 25/05/2017.
//  Copyright © 2017 Mohammad Farrukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     override func viewDidLoad() {
          super.viewDidLoad()
          colorView.layer.cornerRadius = 5
          updateControls()
          updateColour()
          // Do any additional setup after loading the view, typically from a nib.
     }

     override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
     }

     // UI elements //
     
     // colour view
     @IBOutlet weak var colorView: UIView!
     
     // rgb switches
     @IBOutlet weak var redSwitch: UISwitch!
     @IBOutlet weak var greenSwitch: UISwitch!
     @IBOutlet weak var blueSwitch: UISwitch!
     // rgb sliders
     @IBOutlet weak var redSlider: UISlider!
     @IBOutlet weak var greenSlider: UISlider!
     @IBOutlet weak var blueSlider: UISlider!
     
     
     // UI functions //
     
     // action functions for switches and sliders
     @IBAction func switchChanged(_ sender: UISwitch) {
          // change colour on ui switch change
          updateControls()
          updateColour()
     }
     @IBAction func sliderChanged(_ sender: Any) {
          // change colour values using slider range 0,1 in updateColour
          updateColour()
     }
     
     @IBAction func reset(_ sender: Any) {
          // reset slider values
          redSlider.value = 0
          greenSlider.value = 0
          blueSlider.value = 0
          // reset switches
          redSwitch.isOn = false
          greenSwitch.isOn = false
          blueSwitch.isOn = false
          // update ui controls and view
          updateControls()
          updateColour()
     }
     
     // function to update colour for each individual switch
     func updateColour(){
          // colour values
          var rgbRed: CGFloat = 0
          var rgbGreen: CGFloat = 0
          var rgbBlue: CGFloat = 0
          // check if switches have been turned on
          if redSwitch.isOn { rgbRed = CGFloat(redSlider.value) }
          if greenSwitch.isOn{ rgbGreen = CGFloat(greenSlider.value) }
          if blueSwitch.isOn{ rgbBlue = CGFloat(blueSlider.value) }
          
          let color = UIColor(red: rgbRed, green: rgbGreen, blue: rgbBlue, alpha: 1)
          
          // assign colour view action function to current colour
          colorView.backgroundColor = color
          
          //print("Red value: \(rgbRed) Green value: \(rgbGreen) Blue value: \(rgbBlue)")
          
     }
     
     // function to disable sliders if switches are off
     func updateControls(){
          redSlider.isEnabled = redSwitch.isOn
          blueSlider.isEnabled = blueSwitch.isOn
          greenSlider.isEnabled = greenSwitch.isOn
     }

}

