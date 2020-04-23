//
//  TailOptionsView.swift
//  FireflyX
//
//  Created by admin on 3/11/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class TailOptionsView {
    static var tailBackground: UIImageView!
    static var tailOptions: UIStackView!
    static var buttons : [UIButton] = []
    //static var tailArrow : UIImageView!
    
    static func setTImage(bg:UIImageView, stack: UIStackView){
        tailBackground = bg
        tailOptions = stack
    }
    static func setTButtons(bt0:UIButton, bt1:UIButton, bt2:UIButton, bt3:UIButton, bt4:UIButton){
        buttons[0] = bt0
        buttons[1] = bt1
        buttons[2] = bt2
        buttons[3] = bt3
        buttons[4] = bt4
    }
    static func hideSomeTailOptions(bodyTemp:String, isSingle: Bool){
        if isSingle{
            for i in 0...4{
                if i != 2 {
                    buttons[i].isHidden = true
                }
            }
        }else{
            for i in 0...4{
                buttons[i].isHidden = true
            }
        }
    }
    static func UpdateTailOptions(bodyTemp:String,isSingle:Bool){
        if isSingle{
            buttons[2].setImage(UIImage(named:"\(bodyTemp)LBig"), for: .normal)
        }else{
            for i in 0...4{
                buttons[i].setImage(UIImage(named:"\(bodyTemp)L\(i)"), for: .normal)
            }
        }
        
    }
    static func toggleTail(){
        tailOptions.isHidden = !tailOptions.isHidden
        tailBackground.isHidden = !tailOptions.isHidden
    }

 
}

