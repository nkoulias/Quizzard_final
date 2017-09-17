//
//  Geo.swift
//  quizzard
//
//  Created by Nick Koulias on 28/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import SpriteKit
import GameplayKit

class Geo: SKSpriteNode {
    func initializeGeo() {
        
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "geography_selection.png"), size: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.pinned = true
        self.physicsBody?.categoryBitMask = ColliderType.Geography
        self.physicsBody?.contactTestBitMask = ColliderType.Pin
        
    }
}
