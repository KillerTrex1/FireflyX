//
//  W2ButtonView.swift
//  FireflyX
//
//  Created by admin on 8/6/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class W2ButtonView{
    var W2Buttons: [UIButton]
    var Wsymbol: Bool!
    init(W20: UIButton, W21: UIButton,W22: UIButton,W23: UIButton){
        W2Buttons = [UIButton]()
        W2Buttons.append(W20)
        W2Buttons.append(W21)
        W2Buttons.append(W22)
        W2Buttons.append(W23)
        Wsymbol = true
        
    }
    func changeWingOptionsImages(isRest: Bool)->Bool{
        Wsymbol = !Wsymbol
        UpdateWingOptionsImages(isRest: isRest)
        return Wsymbol
    }
    func getWsymbol()->Bool{
        return Wsymbol
    }
    
    func UpdateWingOptionsImages(isRest: Bool){
        if Wsymbol{
            for i in 0..<W2Buttons.count{
                W2Buttons[i].setImage(UIImage(named:"LWD\(i)"), for: .normal)

            }
        }else{
            if isRest{
                for i in 0..<W2Buttons.count{
                    W2Buttons[i].setImage(UIImage(named:"LWR\(i)"), for: .normal)
                }
            }else{
                for i in 0..<W2Buttons.count{
                    W2Buttons[i].setImage(UIImage(named:"LWN\(i)"), for: .normal)
                }
            }
            
        }
    }
}
