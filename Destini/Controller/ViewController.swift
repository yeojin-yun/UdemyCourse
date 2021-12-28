//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storybrain = StoryBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = storybrain.updateTitle()
        choice1Button.setTitle(storybrain.updateChoice1(), for: .normal)
        choice2Button.setTitle(storybrain.updateChoice2(), for: .normal)
        
    }
    @IBAction func BtnTapped(_ sender: UIButton) {
        
    }
    
}
