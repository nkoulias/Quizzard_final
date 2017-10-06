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
import AVKit
import Darwin
import Foundation
import GameKit

class GameOverScene: SKScene, GKGameCenterControllerDelegate {
    
    override func didMove(to view: SKView) {
        let final_score = GameManager.instance.getScore()
        let game_over = SKMultilineLabel(text: "Game Over", labelWidth: 500, pos: CGPoint(x: 0,y: 600), fontName:"Blow", fontSize:96.0)
        game_over.zPosition = CGFloat(5.0)
        let score_label = SKMultilineLabel(text: "You scored", labelWidth: 550, pos: CGPoint(x: 0,y: 150), fontName:"Blow", fontSize:78.0)
        score_label.zPosition = CGFloat(5.0)
        let score_text = SKMultilineLabel(text: "\(final_score)", labelWidth: 250, pos: CGPoint(x: 0,y: 50), fontName:"Blow", fontSize:78.0)
        score_text.zPosition = CGFloat(5.0)
        self.addChild(game_over)
        self.addChild(score_label)
        self.addChild(score_text)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(location).name == "PlayAgain" {
                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                let play_scene = MainMenuScene(fileNamed: "MainMenu")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                //click leaderboard
            } else if atPoint(location).name == "leaderboard" {
                run(SKAction.playSoundFileNamed("button_push.mp3", waitForCompletion: false))
                self.view?.isPaused = true
                showLeader()
            }
        }
    }
    func showLeader() {
        let viewControllerVar = self.view?.window?.rootViewController
        let gKGCViewController = GKGameCenterViewController()
        gKGCViewController.gameCenterDelegate = (self as GKGameCenterControllerDelegate)
        viewControllerVar?.present(gKGCViewController, animated: true, completion: nil)
    }
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
        self.view?.isPaused = false
    }
}
