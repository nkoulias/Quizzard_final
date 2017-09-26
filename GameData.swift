//
//  GameData.swift
//  quizzard
//
//  Created by Nick Koulias on 2/5/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import Foundation

class GameData: NSObject, NSCoding {
    
    struct Keys {
        static let IsVoiceOn = "IsVoiceOn"
        static let Accent = "Accent"
        static let VoiceRate = "VoiceRate"
        static let VoicePitch = "VoicePitch"
        static let Character = "Character"
        static let Score = "Score"
        static let Lives = "Lives"
        
    }
    
    private var isVoiceOn = false
    private var accent:String = "en-US"
    private var voiceRate:Float = 0.5
    private var voicePitch:Float = 1.0
    private var character:String = ""
    private var score:Int32 = 0
    private var lives:Int32 = 3
    
    override init() {}
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        self.isVoiceOn = aDecoder.decodeBool(forKey: Keys.IsVoiceOn)
        self.accent = aDecoder.decodeObject(forKey: Keys.Accent) as! String
        self.voiceRate = aDecoder.decodeFloat(forKey: Keys.VoiceRate)
        self.voicePitch = aDecoder.decodeFloat(forKey: Keys.VoicePitch)
        self.character = aDecoder.decodeObject(forKey: Keys.Character)as! String
        self.score = aDecoder.decodeCInt(forKey: Keys.Score)
        self.lives = aDecoder.decodeCInt(forKey: Keys.Lives)
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.isVoiceOn, forKey: Keys.IsVoiceOn)
        aCoder.encode(self.accent, forKey: Keys.Accent)
        aCoder.encode(self.voiceRate, forKey: Keys.VoiceRate)
        aCoder.encode(self.voicePitch, forKey: Keys.VoicePitch)
        aCoder.encode(self.character, forKey: Keys.Character)
        aCoder.encode(self.score, forKey: Keys.Score)
        aCoder.encode(self.lives, forKey: Keys.Lives)
    }
    
    func getLives()->Int32 {
        return self.lives
    }
    
    func setLives(lives: Int32) {
        self.lives = lives
    }
    
    func getScore()->Int32 {
        return self.score
    }
    
    func setScore(score: Int32) {
        self.score = score
    }
    
    func getIsVoiceOn()->Bool {
        return self.isVoiceOn
    }
    
    func setIsVoiceOn(isVoiceOn: Bool) {
        self.isVoiceOn = isVoiceOn
    }
    
    func getAccent()->String {
        return self.accent
    }

    func setAccent(accent:String){
        self.accent = accent
    }
    
    func getVoiceRate()->Float {
        return self.voiceRate
    }
    
    func setVoiceRate(voiceRate:Float) {
        self.voiceRate = voiceRate
    }
    
    func getVoicePitch()->Float {
        return voicePitch
    }
    
    func setVoicePitch(voicePitch:Float) {
        self.voicePitch = voicePitch
    }
    func getCharacter()-> String {
        return character
    }
    
    func setCharacter(character:String){
        self.character = character
    }
}
