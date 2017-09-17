//
//  MainMenuScene.swift
//  quizzard
//
//  Created by Nick Koulias on 21/4/17.
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


class MainMenuScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        let defaults = UserDefaults.standard
        let data:Questions = Questions(topic: "", quest: "", A: "", B: "", C: "", D: "", answer: "")
        GameManager.instance.initializeGameData()
        data.setupQuestions()
            {
                _takeItAll in
                let encode_data = NSKeyedArchiver.archivedData(withRootObject: _takeItAll)
                defaults.set(encode_data, forKey: "Questions")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(location).name == "play_button" {
                let play_scene = CharacterSelectScene(fileNamed: "CharacterSelect")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
