//
//  TailOptionsView.swift
//  FireflyX
//
//  Created by admin on 3/11/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class OptionsWithLeverAndArrows: OptionsWithArrowsView{
    var Lever: UIButton!
    
    init(bg:UIImageView, stack: UIStackView, arrow: UIImageView,lever:UIButton){
        super.init(bg: bg, stack: stack,arrow: arrow)
        Lever = lever
    }


    override func toggle(val: Bool){
        Options.isHidden = val
        Background.isHidden = val
        if !val{
            if ArrowAppear{
                Arrow.isHidden = val
            }
        }else{
            Arrow.isHidden = val
        }
        Lever.isHidden = val
    }

 
}

