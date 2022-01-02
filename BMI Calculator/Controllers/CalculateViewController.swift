//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculateBrain = CalculateBrain()
    
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewWillAppear(_ animated: Bool) {
        heightSlider.value = 0.5
        weightSlider.value = 0.5
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("H : \(heightSlider.value), W: \(weightSlider.value)")
        
        
    }
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        //heightLbl.text = String(format: "%.2f", sender.value) + "m"
        let height = String(format: "%.2f", sender.value)
        heightLbl.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        //weightLbl.text = String(Int(sender.value)) + "kg"
        //weightLbl.text = String(format: "%.0f", sender.value) + "kg"
        let weight = String(format: "%.0f", sender.value)
        weightLbl.text = "\(weight)kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
//        let bmi = weight / pow(height, 2)
//        let bmi = weight / (height * height)
//        bmiValue = String(format: "%.1f", bmi)
        calculateBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let desinationVC = segue.destination as! ResultViewController
            desinationVC.bmiValue = calculateBrain.getBMIValue()
            desinationVC.advice = calculateBrain.getAdvice()
            desinationVC.color = calculateBrain.getColor()
        }
    }
}


