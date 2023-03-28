//
//  ViewController.swift
//  IosBaseInfo
//
//  Created by 김진혁 on 2023/03/28.
//

import UIKit
import SwiftUI
import SnapKit
import Then

//ios 기본 지식을 스마트러닝으로 공부하는 app
class ViewController: UIViewController {
    //전체 스택뷰
    let stackView = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 15
    }
    
    //질문
    let questionLabel = UILabel().then{
        $0.numberOfLines = 0
    }
    
    //알고있는 
    let knownLabel = RoundButton().then{
        $0.roundButton(style: .known )
        $0.addTarget(self, action: #selector(knownClick), for: .touchDown)
    }
    
    //모르는
    let unknownLabel =  RoundButton().then{
        $0.roundButton(style: .unknown )
        $0.addTarget(self, action: #selector(unknownClick), for: .touchDown)
    }
    //힌트
    let hintLabel = UIButton()
    
    //기능
    var tool = QuestionTool()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
        updateUI()
    }
}

extension ViewController{
    
    enum state{
        case base
        case retry
    }
    
    @objc func knownClick(){
        let value = tool.nextQuestion(value: true)
        alertPopUp(value)
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func unknownClick(){
        let popUp = tool.nextQuestion(value: false)
        alertPopUp(popUp)
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    func alertPopUp(_ value: Bool){
        if value{
            let endController = UIAlertController(title: "끝입니다!", message: "총 \(tool.questions.count)중에 \(tool.knownInfo.count)를 알고 있습니다!", preferredStyle: .alert)
            let retry = UIAlertAction(title: "처음부터", style: .default){_ in
                self.tool.knownInfo.removeAll()
                self.tool.unKnownInfo.removeAll()
                self.updateUI()
            }
            
            if !self.tool.unKnownInfo.isEmpty{
                let nuknownRetry = UIAlertAction(title: "모르는 것만", style: .default){_ in
                    self.tool.questions = self.tool.unKnownInfo
                    self.tool.knownInfo.removeAll()
                    self.tool.unKnownInfo.removeAll()
                    self.updateUI()
                }
                endController.addAction(nuknownRetry)
            }

            endController.addAction(retry)

            
            present(endController, animated: true)
        }
    }
    
    @objc func hintClick(){
        print("hint")
    }

    @objc func updateUI(){
        questionLabel.text = tool.QuestionText()
    }
    
    private func attribute(){
        
    }
    
    private func layout(){
        
        [questionLabel,knownLabel,unknownLabel].forEach{
            stackView.addArrangedSubview($0)
        }
        
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints{
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}




// 전처리
#if DEBUG


@available(iOS 13.0, *)

// UIViewControllerRepresentable을 채택
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    // update
    // _ uiViewController: UIViewController로 지정
    func updateUIViewController(_ uiViewController: UIViewController , context: Context) {
        
    }
    // makeui
    func makeUIViewController(context: Context) -> UIViewController {
    // Preview를 보고자 하는 Viewcontroller 이름
    // e.g.)
        return ViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    
    
    @available(iOS 13.0, *)
    static var previews: some View {
        // UIViewControllerRepresentable에 지정된 이름.
        ViewControllerRepresentable()

// 테스트 해보고자 하는 기기
            .previewDevice("iPhone 14")
    }
}
#endif
