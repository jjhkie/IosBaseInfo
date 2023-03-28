//
//  QuestionTool.swift
//  IosBaseInfo
//
//  Created by 김진혁 on 2023/03/28.
//

import UIKit


struct QuestionTool{
    let questions = [
        Question(question: "Bouunds와 Frame의 차이점을 설명하시오", hint: ["https://jjhkie.tistory.com/149"]),
        Question(question: "실제 디바이스가 없을 경우 개발 환경에서 할 수 있는 것과 없는 것을 설명하시오", hint: ["https://jjhkie.tistory.com/193"])
    ]
    
    lazy var knownInfo: [Question] = []
    
    lazy var unKnownInfo: [Question] = []
    
    var questionNumber = 0
    
    func QuestionText() -> String{
        return questions[questionNumber].question
    }
    
    mutating func nextQuestion(value : Bool){
        if value{
            knownInfo.append(questions[questionNumber])
        }else{
            unKnownInfo.append(questions[questionNumber])
        }
        
        if questionNumber + 1 == questions.count{
            let endController = UIAlertController(title: "끝입니다!", message: "총 \(questions.count)중에 \(knownInfo.count)를 알고 있습니다!", preferredStyle: .alert)
            let retry = UIAlertAction(title: "처음부터", style: .default){[weak self] _ in
                guard var strongSelf = self else { return}
                strongSelf.questionNumber = 0
            }
            
            let nuknownRetry = UIAlertAction(title: "모르는 것만", style: .default){_ in
                
            }
        }else{
            questionNumber += 1
        }

    }
}
