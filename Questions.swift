//
//  Questions.swift
//  quizzard
//
//  Created by Nick Koulias on 10/5/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//


import SpriteKit
import CloudKit
import MobileCoreServices


//setup Questions class
class Questions: NSObject, NSCoding {
    var topic: String
    var quest: String
    var A: String
    var B: String
    var C: String
    var D: String
    var answer: String
    
    
    // Memberwise initializer
    init(topic: String, quest: String, A: String, B: String, C: String, D: String, answer: String) {
        self.topic = topic
        self.quest = quest
        self.A = A
        self.B = B
        self.C = C
        self.D = D
        self.answer = answer
    }
    // MARK: NSCoding
    required convenience init?(coder decoder: NSCoder) {
        guard let topic = decoder.decodeObject(forKey: "topic") as? String,
            let quest = decoder.decodeObject(forKey: "question") as? String,
            let A = decoder.decodeObject(forKey: "A") as? String,
            let B = decoder.decodeObject(forKey: "B") as? String,
            let C = decoder.decodeObject(forKey: "C") as? String,
            let D = decoder.decodeObject(forKey: "D") as? String,
            let answer = decoder.decodeObject(forKey: "answer") as? String
            else { return nil }
        
        self.init(
            topic: topic,
            quest: quest,
            A: A,
            B: B,
            C: C,
            D: D,
            answer: answer
        )
    }
    var takeItAll = [Questions]()
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.topic, forKey: "topic")
        aCoder.encode(self.quest, forKey: "question")
        aCoder.encode(self.A, forKey: "A")
        aCoder.encode(self.B, forKey: "B")
        aCoder.encode(self.C, forKey: "C")
        aCoder.encode(self.D, forKey: "D")
        aCoder.encode(self.answer, forKey: "answer")
        
    }
    func setupQuestions(completionHandler: @escaping (_ takeItAll: [Questions]) ->()) {
        var allQuestions = [Questions]()
        var A: String = ""
        var B: String = ""
        var C: String = ""
        var D: String = ""
        var topic: String = ""
        var answer:String = ""
        var quest_name:String = ""
        
        var container: CKContainer
        var publicDB: CKDatabase?
        container = CKContainer.default()
        publicDB = container.publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Question", predicate: predicate)
        publicDB?.perform(query, inZoneWith: nil, completionHandler: ({results, error in
            
            if (error != nil) {
                DispatchQueue.main.async() {
                    print(error!.localizedDescription)
                }
            } else {
                if results!.count > 0 {
                    var temp: Questions
                    for i in 0...(results!.count-1) {
                        A = results?[i].object(forKey: "A") as! String
                        B = results?[i].object(forKey: "B") as! String
                        C = results?[i].object(forKey: "C") as! String
                        D = results?[i].object(forKey: "D") as! String
                        topic = results?[i].object(forKey: "Topic") as! String
                        answer = results?[i].object(forKey: "Answer") as! String
                        quest_name = results?[i].object(forKey: "Name") as! String
                        temp = Questions(topic: topic, quest: quest_name, A: A, B: B, C: C, D: D, answer: answer)
                        allQuestions.append(temp)
                        completionHandler(allQuestions)
                    }
                } else {
                    DispatchQueue.main.async() {
                        print("No record matching the address was found")
                    }
                }
            }
        }))
    }
}
