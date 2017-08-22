//
//  ViewController.swift
//  AnimalSounds
//
//  Created by Mohammad Farrukh on 28/05/2017.
//  Copyright © 2017 Mohammad Farrukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     override func viewDidLoad() {
          super.viewDidLoad()

          // Do any additional setup after loading the view, typically from a nib.
     }

     override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
     }
     
     // UI outlets
     @IBOutlet weak var animalSoundLabel: UILabel!
     @IBOutlet weak var animalInstruction: UILabel!
     
     // UI actions
     @IBAction func catButtonTapped(_ sender: UIButton) {
          animalSoundLabel.text = "Meeeoow!"
          clearInstructionLabel()
     }
     @IBAction func dogButtonTapped(_ sender: UIButton) {
          animalSoundLabel.text = "Woooof!"
          clearInstructionLabel()
     }
     @IBAction func cowButtonTapped(_ sender: UIButton) {
          animalSoundLabel.text = "Moooooo!"
          clearInstructionLabel()
     }
     
     func clearInstructionLabel(){
          animalInstruction.text = ""
     }



}

