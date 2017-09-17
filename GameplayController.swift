//
//  GameplayController.swift
//  quizzard
//
//  Created by Nick Koulias on 23/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import Foundation
import SpriteKit

class GameplayController {
    
    static let instance = GameplayController();
    private init () {}
        var scoreText: SKLabelNode?
        var lifeText: SKLabelNode?
        
        var score: Int?
        var life: Int?
    
    func initializeVariables() {
        
    }
}
