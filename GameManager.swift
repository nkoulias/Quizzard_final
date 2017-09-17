//
//  GameManager.swift
//  quizzard
//
//  Created by Nick Koulias on 23/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import Foundation
import SpriteKit

class GameManager {
    static let instance = GameManager()
    private init() {}
    private var gameData: GameData?
    var lives_text = SKLabelNode()
    var lives_char = SKSpriteNode()
    var main_char = SKSpriteNode()
    var score_text = SKLabelNode()
    
    func initializeGameData() {
        if !FileManager.default.fileExists(atPath: getFilePath() as String) {
            gameData = GameData()
            gameData?.setIsVoiceOn(isVoiceOn: true)
            gameData?.setScore(score: 0)
            gameData?.setLives(lives: 3)
            gameData?.setAccent(accent: "en-GB")
            gameData?.setVoicePitch(voicePitch: 1.0)
            gameData?.setVoiceRate(voiceRate: 0.5)
            saveData()
        }
        loadData()
    }
    
    func loadData() {
        gameData = NSKeyedUnarchiver.unarchiveObject(withFile: getFilePath() as String) as? GameData
    }
    func saveData() {
        if gameData != nil {
            NSKeyedArchiver.archiveRootObject(gameData!, toFile: getFilePath() as String)
        }
    }
    
    private func getFilePath() ->String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first as URL!
        return url!.appendingPathComponent("Game Manager").path
    }
    
    func getScore() -> Int32 {
        return (self.gameData!.getScore())
    }

    func setScore(score:Int32){
        self.gameData?.setScore(score: score)
    }
    
    func getIsVoiceOn()->Bool {
        return (self.gameData!.getIsVoiceOn())
    }
    
    func setIsVoiceOn(isVoiceOn: Bool) {
        self.gameData?.setIsVoiceOn(isVoiceOn: isVoiceOn)
        
    }
    
    func getAccent()->String {
        return (self.gameData!.getAccent())
        
    }
    
    func setAccent(accent:String){
        self.gameData?.setAccent(accent: accent)
        
    }
    
    func getVoiceRate()->Float {
        return (self.gameData!.getVoiceRate())
        
    }
    
    func setVoiceRate(voiceRate:Float) {
        self.gameData?.setVoiceRate(voiceRate: voiceRate)
    }
    
    func getVoicePitch()->Float {
        return (self.gameData!.getVoicePitch())
    }
    
    func setVoicePitch(voicePitch:Float) {
        self.gameData?.setVoicePitch(voicePitch: voicePitch)
    }
    func getCharacter()-> String {
        return (self.gameData!.getCharacter())
    }
    
    func setCharacter(character:String){
        self.gameData?.setCharacter(character: character)
    }
    
    func getLives()->Int32{
        return (self.gameData!.getLives())
    }
    func setLives(lives:Int32){
        self.gameData?.setLives(lives: lives)
    }
	    
    func setLivesIcon() {
        switch GameManager.instance.getCharacter() {
        case "angry_teacher":
            lives_char = SKSpriteNode(imageNamed: "angry_teacher_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "angry_teacher")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
        case "green_monster":
            lives_char = SKSpriteNode(imageNamed: "single_eye_green_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "single_eye_green")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            main_char.setScale(0.9)
        case "slow_monster":
            lives_char = SKSpriteNode(imageNamed: "purple_cutey_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "purple_cutey")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            main_char.setScale(0.8)
        case "drinking_monster":
            lives_char = SKSpriteNode(imageNamed: "party_animal_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "party_animal")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
        case "octopus":
            lives_char = SKSpriteNode(imageNamed: "octopus_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "octopus")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            main_char.setScale(0.9)
        case "monocle":
            lives_char = SKSpriteNode(imageNamed: "monocle_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "monocle")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            main_char.setScale(0.9)
        case "happy_monster":
            lives_char = SKSpriteNode(imageNamed: "green_monster_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "green_monster")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            main_char.setScale(0.8)
        default:
            break
        }
    }
    func setLivesText() {
        switch GameManager.instance.getLives() {
        case 1:
            lives_text.position = CGPoint(x: GameManager.instance.lives_char.position.x+75, y: GameManager.instance.lives_char.position.y-15)
            lives_text.fontName = "Blow"
            lives_text.fontSize = 48
            lives_text.color = UIColor(white: 1, alpha: 1)
            lives_text.text = "x1"
            lives_text.zPosition = CGFloat(5.0)
        case 2:
            lives_text.position = CGPoint(x: GameManager.instance.lives_char.position.x+75, y: GameManager.instance.lives_char.position.y-15)
            lives_text.fontName = "Blow"
            lives_text.fontSize = 48
            lives_text.color = UIColor(white: 1, alpha: 1)
            lives_text.text = "x2"
            lives_text.zPosition = CGFloat(5.0)
        case 3:
            lives_text.position = CGPoint(x: GameManager.instance.lives_char.position.x+75, y: GameManager.instance.lives_char.position.y-15)
            lives_text.fontName = "Blow"
            lives_text.color = UIColor(white: 1, alpha: 1)
            lives_text.fontSize = 48
            lives_text.text = "x3"
            lives_text.zPosition = CGFloat(5.0)
        default:
            break
        }
    }
    func setScoreText() {
        score_text.position = CGPoint(x: GameManager.instance.lives_char.position.x+500, y: GameManager.instance.lives_char.position.y-15)
        score_text.fontName = "Blow"
        score_text.fontSize = 48
        score_text.color = UIColor(white: 1, alpha: 1)
        score_text.text = "\(GameManager.instance.getScore())"
        score_text.zPosition = CGFloat(5.0)
    }
}
