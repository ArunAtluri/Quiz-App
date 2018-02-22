//
//  Question.swift
//  Quizzler
//
//  Created by Arun Atluri on 20/02/18.
//  Copyright © 2018 Arun Atluri. All rights reserved.
//

import Foundation

class Question {
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
