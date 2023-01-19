//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    var bmiValue = "0.0"
    var advice = ""
    var color = UIColor()
 
  
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!    
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let heightLabelTitle = String(format: "%.2f", sender.value)
        heightLabel.text = "\(heightLabelTitle) M"
      
        
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
      let weightLabelTitle = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weightLabelTitle) Kg"
       
    
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
                destinationVC.bmiValue = calculatorBrain.getBMIValue()
                destinationVC.advice = calculatorBrain.getAdvice()
                destinationVC.color = calculatorBrain.getColor()
            
            
            
        }
    }
        
}

