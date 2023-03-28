//
//  QuestionTool.swift
//  IosBaseInfo
//
//  Created by 김진혁 on 2023/03/28.
//

import UIKit


struct QuestionTool{
    var questions = [
        Question(question: "Bouunds와 Frame의 차이점을 설명하시오", hint: ["https://jjhkie.tistory.com/149"]),
        Question(question: "실제 디바이스가 없을 경우 개발 환경에서 할 수 있는 것과 없는 것을 설명하시오", hint: ["https://jjhkie.tistory.com/193"])
    ]
    
    lazy var initialInfo: [Question] = []
    
    lazy var knownInfo: [Question] = []
    
    lazy var unKnownInfo: [Question] = []
    
    var questionNumber = 0
    
    func QuestionText() -> String{
        return questions[questionNumber].question
    }
    
    mutating func nextQuestion(value : Bool) -> Bool{
        if value{
            knownInfo.append(questions[questionNumber])
        }else{
            unKnownInfo.append(questions[questionNumber])
        }
        
        if questionNumber + 1 == questions.count{
            questionNumber = 0
            return true
        }else{
            questionNumber += 1
            return false
        }

    }
}
