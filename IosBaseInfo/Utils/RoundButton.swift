//
//  RoundButton.swift
//  IosBaseInfo
//
//  Created by 김진혁 on 2023/03/28.
//

import UIKit


class RoundButton: UIButton{

    func roundButton(style: ButtonStyle){
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = style.backgroundColor
        config.title = style.title
        config.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
        
        configuration = config
    }
    
    
    enum ButtonStyle{
        case known
        case unknown
        case hint
        
        var title: String{
            switch self{
            case .known:
                return "충분한 설명을 할 수 있습니다."
            case .unknown:
                return "조금 더 알아보고 싶습니다."
            case .hint:
                return "참고"
            }
        }
        
        var backgroundColor: UIColor{
            switch self{
                
            case .known:
                return UIColor.orange
            case .unknown:
                return UIColor.blue
            case .hint:
                return UIColor.cyan
            }
        }
    }
}
