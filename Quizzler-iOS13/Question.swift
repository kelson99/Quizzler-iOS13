//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Kelson Hartle on 8/10/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var answersArray: [String]
    var correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answersArray = a
        self.correctAnswer = correctAnswer
    }
}


