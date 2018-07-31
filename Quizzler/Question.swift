//  Question.swift
//  Quizzler
//
//  Created by Jesus Perez on 6/19/18.
//  Copyright © 2018 Jesus Perez. All rights reserved.

import Foundation


/* New class to take in paramaters that determines the intial values when creating new instances*/
class Question  {
    
    let questionText : String
    let answer : Bool
    
    
    //Initialization Code
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}

