//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by 순진이 on 2022/01/01.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBrain {
    
    /* 여진 버전===================================================
     var bmiValue = "0.0"
     
     mutating func calculateBMI(height: Float, weight: Float) {
     let bmi = weight / (height * height)
     self.bmiValue = String(format: "%.1f", bmi)
     }
     
     func getBMIValue() -> String {
     return bmiValue
     }
     ================================================================*/
    
    
    var bmi: BMI?
    

    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies🥨", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        } else if bmiValue < 25 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle🥳", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies😤", color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        //nil coalacing
        let bmiToDecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToDecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .black
    }
}


/*
 underweight =< 18.5
 normal weight = 18.5 ~ 24.9
 overweight = 25
 */
