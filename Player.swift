//
//  Player.swift
//  quizzard
//
//  Created by Nick Koulias on 19/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import SpriteKit
import GameplayKit

struct ColliderType {
    static let Geography: UInt32 = 1
    static let Maths: UInt32 = 2
    static let History: UInt32 = 3
    static let Science: UInt32 = 4
    static let Pin: UInt32 = 5
}


class Player: SKSpriteNode {
    
    func initializePlayer() {
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(self.frame.width)/2)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.pinned = true
    }
    func rotatePlayer() {
        let random = GKRandomDistribution(lowestValue: 50, highestValue: 2000)
        let r = random.nextInt()
        self.physicsBody?.angularVelocity = 0
        self.physicsBody?.angularVelocity = CGFloat(r)
        self.physicsBody?.angularDamping = 0.6
        
    }
}
