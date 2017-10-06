//
//  QuestionScene.swift
//  quizzard
//
//  Created by Nick Koulias on 24/4/17.
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

class QuestionScene: SKScene, AVSpeechSynthesizerDelegate {
    
    
    let synth = AVSpeechSynthesizer()
    let correctUtterance = AVSpeechUtterance(string: "Correct")
    let incorrectUtterance = AVSpeechUtterance(string: "Incorrect")
    var result:Int = 0
    var narrow = [Questions]()
    let getScore = GameManager.instance.getScore()
    let getLives = GameManager.instance.getLives()
    
    var qNum:Int = 0
    
    override func didMove(to view: SKView) {
        synth.delegate = self
        let cmon = UserDefaults.standard
        let decode_data = cmon.object(forKey: "Questions") as? Data
        var setup = NSKeyedUnarchiver.unarchiveObject(with: (decode_data)!) as! [Questions]
        let decode_topic = cmon.object(forKey: "Topic") as? String
        narrow = setup.filter({$0.topic == decode_topic})
        let qCount = Int(narrow.count)
        result = pickQuestion(input: UInt32(qCount))
        showData(input: result, filter: narrow)
        RandomQuestions(input: Int(result), filter: narrow)
        setup = setup.filter({$0.quest != narrow[result].quest})
        let encode_data = NSKeyedArchiver.archivedData(withRootObject: setup)
        cmon.set(encode_data, forKey: "Questions")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        qNum = narrow.count
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(location).name == "button_a" {

                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                synth.stopSpeaking(at: AVSpeechBoundary.word)
                if (narrow[result].answer == "A") {
                    GameManager.instance.setScore(score: getScore+100)
                    synth.speak(correctUtterance)
                    narrow.remove(at: result)
                    qNum = qNum - 1
                    if (qNum < 1) {
                        gameOver()
                    } else {
                        nextQuestion()
                    }
                }
                else {
                        synth.stopSpeaking(at: AVSpeechBoundary.word)
                        synth.speak(incorrectUtterance)
                        narrow.remove(at: result)
                    if (GameManager.instance.getScore() > 0){
                        GameManager.instance.setScore(score: getScore-100)
                    }
                        GameManager.instance.setLives(lives: getLives-1)
                    if (GameManager.instance.getLives() < 1) {
                        gameOver()
                    }
                    else {
                            nextQuestion()
                        }
                }
            }
            if atPoint(location).name == "button_b" {
                synth.stopSpeaking(at: AVSpeechBoundary.word)
                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                if (narrow[result].answer == "B") {
                    GameManager.instance.setScore(score: getScore+100)
            
                    synth.speak(correctUtterance)
                    narrow.remove(at: result)
                    qNum = qNum - 1
                    if (qNum < 1) {
                        gameOver()
                    } else {
                        nextQuestion()
                    }
                }
                else {
                    synth.speak(incorrectUtterance)
                    if (GameManager.instance.getScore() > 0){
                        GameManager.instance.setScore(score: getScore-100)
                    }
                    GameManager.instance.setLives(lives: getLives-1)
                    narrow.remove(at: result)
                    if (GameManager.instance.getLives() < 1) {
                        gameOver()
                    } else {
                        nextQuestion()
                    }
                }
                
            }
            if atPoint(location).name == "button_c" {
                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                synth.stopSpeaking(at: AVSpeechBoundary.word)
                if (narrow[result].answer == "C") {
                    GameManager.instance.setScore(score: getScore+100)
                    synth.speak(correctUtterance)
                    narrow.remove(at: result)
                    qNum = qNum - 1
                    if (qNum < 1) {
                        gameOver()
                    } else {
                        nextQuestion()
                    }
                }
                else {
                    narrow.remove(at: result)
                    synth.speak(incorrectUtterance)
                    if (GameManager.instance.getScore() > 0){
                        GameManager.instance.setScore(score: getScore-100)
                    }
                    GameManager.instance.setLives(lives: getLives-1)
                    if (GameManager.instance.getLives() < 1) {
                        gameOver()
                    } else {
                        nextQuestion()
                    }
                }
                
            }
            if atPoint(location).name == "button_d" {
                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                synth.stopSpeaking(at: AVSpeechBoundary.word)
                if (narrow[result].answer == "D") {
                    GameManager.instance.setScore(score: getScore+100)
                    synth.speak(correctUtterance)
                    narrow.remove(at: result)
                    qNum = qNum - 1
                    if (qNum < 1) {
                        gameOver()
                    } else {
                        nextQuestion()
                    }
                }
                else {
                    synth.stopSpeaking(at: AVSpeechBoundary.word)
                    synth.speak(incorrectUtterance)
                    if (GameManager.instance.getScore() > 0){
                        GameManager.instance.setScore(score: getScore-100)
                    }
                    GameManager.instance.setLives(lives: getLives-1)
                    narrow.remove(at: result)
                    if (GameManager.instance.getLives() < 1) {
                        gameOver()
                    } else {
                        nextQuestion()
                    }
                }
                
            }
        }
    }
    func pickQuestion(input:UInt32) -> Int {
        return Int(arc4random() % input)
    }
    
    func RandomQuestions (input:Int, filter:[Questions]) {

        let qUtterance = AVSpeechUtterance(string: filter[input].quest)
        let aUtterance = AVSpeechUtterance(string: filter[input].A)
        let bUtterance = AVSpeechUtterance(string: filter[input].B)
        let cUtterance = AVSpeechUtterance(string: filter[input].C)
        let dUtterance = AVSpeechUtterance(string: filter[input].D)
        let orUtterance = AVSpeechUtterance(string: "or")

        qUtterance.preUtteranceDelay = 1.0
        synth.speak(qUtterance)
        qUtterance.postUtteranceDelay = 0.1
        synth.speak(aUtterance)
        aUtterance.postUtteranceDelay = 0.1
        synth.speak(bUtterance)
        bUtterance.postUtteranceDelay = 0.1
        synth.speak(cUtterance)
        cUtterance.postUtteranceDelay = 0.1
        synth.speak(orUtterance)
        synth.speak(dUtterance)
        
    }
    
    func showData(input: Int, filter: [Questions]) {
        
        let question_label = SKMultilineLabel(text: filter[input].quest, labelWidth: 700, pos: CGPoint(x: 0,y: 550), fontSize:38.0)
        question_label.zPosition = CGFloat(5.0)
        self.addChild(question_label)
        
        let a_label = SKMultilineLabel(text: filter[input].A, labelWidth: 500, pos: CGPoint(x: 0,y: 200), fontSize:38.0)
        a_label.zPosition = CGFloat(5.0)
        //let a_label = SKLabelNode()
//        a_label.fontName = "Avenir"
//        a_label.fontSize = 38
//        a_label.color = UIColor(white: 1, alpha: 1)
//        a_label.position = CGPoint(x: 0, y: 170)
//        a_label.zPosition = CGFloat(5.0)
//        a_label.text = filter[input].A
        self.addChild(a_label)
        let b_label = SKMultilineLabel(text: filter[input].B, labelWidth: 500, pos: CGPoint(x: 0,y: 50), fontSize:38.0)
        b_label.zPosition = CGFloat(5.0)
//        let b_label = SKLabelNode()
//        b_label.fontName = "Avenir"
//        b_label.fontSize = 38
//        b_label.color = UIColor(white: 1, alpha: 1)
//        b_label.position = CGPoint(x: 0, y: 20)
//        b_label.zPosition = CGFloat(5.0)
//        b_label.text = filter[input].B
        self.addChild(b_label)
        let c_label = SKMultilineLabel(text: filter[input].C, labelWidth: 500, pos: CGPoint(x: 0,y: -100), fontSize:38.0)
        c_label.zPosition = CGFloat(5.0)
//        let c_label = SKLabelNode()
//        c_label.fontName = "Avenir"
//        c_label.fontSize = 38
//        c_label.color = UIColor(white: 1, alpha: 1)
//        c_label.position = CGPoint(x: 0, y: -130)
//        c_label.zPosition = CGFloat(5.0)
//        c_label.text = filter[input].C
        self.addChild(c_label)
        let d_label = SKMultilineLabel(text: filter[input].D, labelWidth: 500, pos: CGPoint(x: 0,y: -250), fontSize:38.0)
        d_label.zPosition = CGFloat(5.0)
//        let d_label = SKLabelNode()
//        d_label.fontName = "Avenir"
//        d_label.fontSize = 38
//        d_label.color = UIColor(white: 1, alpha: 1)
//        d_label.position = CGPoint(x: 0, y: -280)
//        d_label.zPosition = CGFloat(5.0)
//        d_label.text = filter[input].D
        self.addChild(d_label)
        
    }
    func gameOver() {
        let play_scene = GameOverScene(fileNamed: "GameOver")
        play_scene?.scaleMode = .aspectFill
        self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
    }
    
    func nextQuestion() {
        let play_scene = GameplayScene(fileNamed: "Spin")
        play_scene?.scaleMode = .aspectFill
        self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
    }
}
