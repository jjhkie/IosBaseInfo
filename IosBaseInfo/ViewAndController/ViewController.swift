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
        $0.backgroundColor = .red
    }
    
    //알고있는 
    let knownLabel = RoundButton().then{
        $0.roundButton(style: .known )
    }
    
    //모르는
    let unknownLabel =  RoundButton().then{
        $0.roundButton(style: .unknown )
    }
    //힌트
    let hintLabel = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
    }


}

extension ViewController{
    

    
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
