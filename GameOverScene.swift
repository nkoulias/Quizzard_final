//
//  GameOverScene.swift
//  quizzard
//
//  Created by Nick Koulias on 4/6/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import SpriteKit
import CloudKit
import MobileCoreServices
import AVFoundation
import AVKit
import Darwin
import Foundation
import GameKit

class GameOverScene: SKScene {
    
    override func didMove(to view: SKView) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(location).name == "Again" {
                let play_scene = MainMenuScene(fileNamed: "MainMenu")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
            }
        }
    }
}
