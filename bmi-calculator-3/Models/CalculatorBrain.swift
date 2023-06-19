//
//  CalculatorBrain.swift
//  bmi-calculator-3
//
//  Created by phillip jarrar on 6/19/23.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? "0.0")
    }
    
    
    mutating func calculateBMI(height: Float, weight: Float) -> Float{
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "eat more food.", color: UIColor.systemBlue)
        } else if bmiValue > 18.5 && bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "you're doing great", color: UIColor.systemGreen)
        } else {
            bmi = BMI(value: bmiValue, advice: "Excercise, and a healthy diet is key", color: UIColor.systemRed)
        }
        
        
        return bmiValue
        
    }
    
    func getColor() -> UIColor{
        let color = bmi?.color ?? UIColor.gray
        return color
    }
    
    func getAdvice() -> String{
        let advice = bmi?.advice ?? "nothing to see here"
        return advice
    }
    
    func metersToFeet(meters: Float) -> Float{
        return meters / 0.3048
    }
    
    func kiloToPounds(kilo: Float) -> Float{
        return kilo * 2.20462
    }

    
}
