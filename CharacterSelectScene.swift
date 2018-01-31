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
import AVFoundation
import GameKit

class CharacterSelectScene: SKScene, AVSpeechSynthesizerDelegate {
    let char_synth = AVSpeechSynthesizer()
    let friendly_frank = AVSpeechUtterance(string: "Friendly Frank")
    let angry_anderson = AVSpeechUtterance(string: "Angry Anderson")
    let georgie_porgy = AVSpeechUtterance(string: "Georgie Porji")
    let monocle_moses = AVSpeechUtterance(string: "Monocle Moses")
    let octavia_occy = AVSpeechUtterance(string: "Octavia Okki")
    let party_pete = AVSpeechUtterance(string: "Party Pete")
    let smiley_sam = AVSpeechUtterance(string: "Smiling Salmon")
    

    
    override func didMove(to view: SKView) {
        char_synth.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(location).name == "angry_teacher" {
//                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                char_synth.speak(angry_anderson)
                let play_scene = GameplayScene(fileNamed: "Spin")
                GameManager.instance.setCharacter(character: "angry_teacher")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                
            } else if atPoint(location).name == "happy_monster" {
//                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                char_synth.speak(georgie_porgy)
                let play_scene = GameplayScene(fileNamed: "Spin")
                GameManager.instance.setCharacter(character: "happy_monster")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                
            }else if atPoint(location).name == "monocle" {
//                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                char_synth.speak(monocle_moses)
                let play_scene = GameplayScene(fileNamed: "Spin")
                GameManager.instance.setCharacter(character: "monocle")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                
            }else if atPoint(location).name == "octopus" {
//                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                char_synth.speak(octavia_occy)
                let play_scene = GameplayScene(fileNamed: "Spin")
                GameManager.instance.setCharacter(character: "octopus")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                
            }else if atPoint(location).name == "drinking_monster" {
//                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                char_synth.speak(party_pete)
                let play_scene = GameplayScene(fileNamed: "Spin")
                GameManager.instance.setCharacter(character: "drinking_monster")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                
            }else if atPoint(location).name == "slow_monster" {
//                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                char_synth.speak(smiley_sam)
                let play_scene = GameplayScene(fileNamed: "Spin")
                GameManager.instance.setCharacter(character: "slow_monster")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                
            }else if atPoint(location).name == "green_monster" {
//                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                char_synth.speak(friendly_frank)
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
