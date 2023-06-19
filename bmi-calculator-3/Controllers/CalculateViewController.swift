//
//  ViewController.swift
//  bmi-calculator-3
//
//  Created by phillip jarrar on 6/19/23.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightNumberLabel: UILabel!
    @IBOutlet weak var weightNumberLabel: UILabel!
    @IBOutlet weak var heightValueInFeet: UILabel!
    @IBOutlet weak var weightValueInPounds: UILabel!
    
    
    @IBAction func heightValueChanged(_ sender: UISlider) {
        let formattedString = String(format: "%.2f", sender.value)
        let feetValue = String(format: "%.2f", calculatorBrain.metersToFeet(meters: sender.value))
        heightNumberLabel.text = formattedString + " m"
        heightValueInFeet.text = feetValue + " f/"
    }
    
    @IBAction func weightValueChanged(_ sender: UISlider) {
        let formmatedString = String(format: "%.0f", sender.value)
        let poundsValue = String(format: "%.2f", calculatorBrain.kiloToPounds(kilo: sender.value))
        weightNumberLabel.text = formmatedString + " kg"
        weightValueInPounds.text = poundsValue + " lbs/"
    }
    
    
    @IBAction func calculatePressed(_ sender: Any) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        
        
        // grabs the value from the sliders and inputs them into this function.
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        heightValueInFeet.text = "4.9f/"
        weightValueInPounds.text = "220.46lbs/"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            // view controller that is initialized when the segue is performed
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmi = calculatorBrain.getBMIValue()
            destinationVC.color = calculatorBrain.getColor()
            destinationVC.advice = calculatorBrain.getAdvice()
            
            
        }
    }
    
    
}

