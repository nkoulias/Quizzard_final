//
//  CharacterSelectScene.swift
//  quizzard
//
//  Created by Nick Koulias on 24/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import SpriteKit
import CloudKit
import MobileCoreServices
import AVKit
import Darwin
import Foundation
import GameKit

class CharacterSelectScene: SKScene {
    

    
    override func didMove(to view: SKView) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(location).name == "angry_teacher" {
                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                let play_scene = GameplayScene(fileNamed: "Spin")
                GameManager.instance.setCharacter(character: "angry_teacher")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                
            } else if atPoint(location).name == "happy_monster" {
                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                let play_scene = GameplayScene(fileNamed: "Spin")
                GameManager.instance.setCharacter(character: "happy_monster")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                
            }else if atPoint(location).name == "monocle" {
                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                let play_scene = GameplayScene(fileNamed: "Spin")
                GameManager.instance.setCharacter(character: "monocle")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                
            }else if atPoint(location).name == "octopus" {
                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                let play_scene = GameplayScene(fileNamed: "Spin")
                GameManager.instance.setCharacter(character: "octopus")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                
            }else if atPoint(location).name == "drinking_monster" {
                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                let play_scene = GameplayScene(fileNamed: "Spin")
                GameManager.instance.setCharacter(character: "drinking_monster")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                
            }else if atPoint(location).name == "slow_monster" {
                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                let play_scene = GameplayScene(fileNamed: "Spin")
                GameManager.instance.setCharacter(character: "slow_monster")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                
            }else if atPoint(location).name == "green_monster" {
                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                let play_scene = GameplayScene(fileNamed: "Spin")
                GameManager.instance.setCharacter(character: "green_monster")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
}
