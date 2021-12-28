//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    var storyNumBer = 0
    
    let story = [
        Story(title: "You see a fork in the road", choice1: "Take a left", choice2: "Take a right"),
        Story(title: "You see a tiger", choice1: "Shout for helf", choice2: "Play dead"),
        Story(title: "You find a treasure chest", choice1: "Open it", choice2: "Check for traps")
    ]
    
    func updateTitle() -> String {
        return story[storyNumBer].title
        
    }
    
    func updateChoice1() -> String {
        return story[storyNumBer].choice1
    }
    
    func updateChoice2() -> String {
        return story[storyNumBer].choice2
    }

    func updateUI() {
        
    }
}


