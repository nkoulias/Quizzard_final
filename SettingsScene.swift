//
//  SettingsScene.swift
//  quizzard
//
//  Created by Nick Koulias on 30/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import SpriteKit

class SettingsScene: SKScene {
    
    override func didMove(to view: SKView) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(location).name == "back_button" {
                let play_scene = GameplayScene(fileNamed: "Spin")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
            }
        }
    }
}
