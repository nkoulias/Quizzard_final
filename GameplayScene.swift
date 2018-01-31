//
//  GameplayScene.swift
//  quizzard
//
//  Created by Nick Koulias on 19/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import SpriteKit
import GameKit
import AVFoundation

class GameplayScene: SKScene, SKPhysicsContactDelegate, AVSpeechSynthesizerDelegate, GKGameCenterControllerDelegate {
    
    var musicArray = ["games", "spongebob"]
    var randomIndex = 0
    var audioPlayer = AVAudioPlayer()
    private var player: Player?
    private var maths: Maths?
    private var history: History?
    private var science: Science?
    private var geography: Geo?
    var pin: Pin?
    public var topic :String = ""
    public var finishedRotation: Bool = false
    var play_button: SKNode?
    var leader_button: SKNode?
    
    
    override func didMove(to view: SKView) {
        let pickSound = playMusic()
        let music = Bundle.main.path(forResource: pickSound, ofType: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: music! ))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        
        player = self.childNode(withName: "spinner") as! Player?;
        maths = player?.childNode(withName: "maths") as! Maths?
        science = player?.childNode(withName: "science") as! Science?
        history = player?.childNode(withName: "history") as! History?
        geography = player?.childNode(withName: "geography") as! Geo?
        pin = self.childNode(withName: "pin") as! Pin?
        finishedRotation = false
        play_button = self.childNode(withName: "play_button")
        leader_button = self.childNode(withName: "leaderboard")
        player?.initializePlayer()
        maths?.initializeMaths()
        science?.initializeScience()
        history?.initializeHistory()
        pin?.initializePin()
        geography?.initializeGeo()
        physicsWorld.contactDelegate = self
        GameManager.instance.setLivesIcon()
        GameManager.instance.setLivesText()
        GameManager.instance.setScoreText()
        self.addChild(GameManager.instance.lives_char)
        self.addChild(GameManager.instance.main_char)
        self.addChild(GameManager.instance.lives_text)
        self.addChild(GameManager.instance.score_text)
        saveHighscore(gameScore: Int(GameManager.instance.getScore()))
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
    
            //Start spinning the wheel
            if atPoint(location).name == "play_button" {
                play_button!.isUserInteractionEnabled = true
                player?.physicsBody?.angularVelocity = 0
                play_button?.alpha = 0.30
                player?.rotatePlayer()
                audioPlayer.play()
                
            }
//            else if atPoint(location).name == "leaderboard" {
//                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
//                self.view?.isPaused = true
//                showLeader()
//            }
        }
    }
    override func didSimulatePhysics() {
        let speed = player?.physicsBody?.angularVelocity
        if (speed != CGFloat(0.0)) {
            if (speed! <= CGFloat(0.1)){
                finishedRotation = true
                play_button!.isUserInteractionEnabled = false
            }
        }
    }
    override func didFinishUpdate() {
        if (finishedRotation == true) {
            audioPlayer.setVolume(0.0, fadeDuration: 0.5)
            let play_scene = QuestionScene(fileNamed: "QuestionScene")
            play_scene?.scaleMode = .aspectFill
            self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        
        let defaults = UserDefaults.standard
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        if (contact.bodyA.node?.name == "pin") {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        if (firstBody.node?.name == "pin" && secondBody.node?.name == "geography") {
            let set_topic = secondBody.node?.name
            defaults.set(set_topic, forKey: "Topic")
        } else if (firstBody.node?.name == "pin" && secondBody.node?.name == "maths") {
            let set_topic = secondBody.node?.name
            defaults.set(set_topic, forKey: "Topic")
        } else if (firstBody.node?.name == "pin" && secondBody.node?.name == "history") {
            let set_topic = secondBody.node?.name
            defaults.set(set_topic, forKey: "Topic")
        } else if (firstBody.node?.name == "pin" && secondBody.node?.name == "science") {
            let set_topic = secondBody.node?.name
            defaults.set(set_topic, forKey: "Topic")
        }
    }
//    func showLeader() {
//        let viewControllerVar = self.view?.window?.rootViewController
//        let gKGCViewController = GKGameCenterViewController()
//        gKGCViewController.gameCenterDelegate = (self as GKGameCenterControllerDelegate)
//        viewControllerVar?.present(gKGCViewController, animated: true, completion: nil)
//    }
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
        self.view?.isPaused = false
    }
    func saveHighscore(gameScore: Int) {
        
        if GKLocalPlayer.localPlayer().isAuthenticated {
            
            let scoreReporter = GKScore(leaderboardIdentifier: "com.leaderboard.quizzard")
            scoreReporter.value = Int64(gameScore)
            let scoreArray: [GKScore] = [scoreReporter]
            
            GKScore.report(scoreArray, withCompletionHandler: {error -> Void in
                if error != nil {
                    print("An error has occured: \(String(describing: error))")
                }
            })
        }
    }
    func playMusic ()-> String {
        randomIndex = Int(arc4random_uniform(UInt32(musicArray.count)))
        let selectedFileName = musicArray[randomIndex]
        return selectedFileName
    }
}
