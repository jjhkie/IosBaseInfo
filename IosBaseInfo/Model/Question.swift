//
//  Question.swift
//  IosBaseInfo
//
//  Created by 김진혁 on 2023/03/28.
//

import Foundation

struct Question{
    let question : String
    let hint: [String]
    
    
    init(question: String, hint: [String]) {
        self.question = question
        self.hint = hint
    }
}
