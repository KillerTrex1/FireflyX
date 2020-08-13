//
//  TailButtonView.swift
//  FireflyX
//
//  Created by admin on 8/6/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class TailButtonsView{
    var TailButtons: [UIButton]
    init(T0: UIButton, T1: UIButton,T2: UIButton,T3: UIButton,T4: UIButton){
        TailButtons = [UIButton]()
        TailButtons.append(T0)
        TailButtons.append(T1)
        TailButtons.append(T2)
        TailButtons.append(T3)
        TailButtons.append(T4)
        
    }
    func ChangeTailOptionsCount(isWhole:Bool,bodyTemp:String){
        for i in 0..<TailButtons.count{
            if i != 2{
                TailButtons[i].isHidden = isWhole
            }
        }

        UpdateTailOptions(isSingle:isWhole,bodyTemp: bodyTemp)
    }
    func UpdateTailOptions(isSingle:Bool,bodyTemp:String){
        if isSingle{
            TailButtons[2].setImage(UIImage(named:"\(bodyTemp)LBig"), for: .normal)
            //Tail2.setImage(UIImage(named:"\(bodyTemp)LBig"), for: .normal)
        }else{
            for i in 0..<TailButtons.count{
                TailButtons[i].setImage(UIImage(named:"\(bodyTemp)L\(i)"), for: .normal)
            }
        }
        
    }
}
