//
//  LeftWingOptionsView.swift
//  FireflyX
//
//  Created by admin on 3/12/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class OptionsWithArrowsView: OptionsView {
    var Arrow: UIImageView!
    var ArrowAppear: Bool!
    
    init(bg:UIImageView, stack: UIStackView, arrow: UIImageView){
        super.init(bg: bg, stack: stack)
        Arrow = arrow
        ArrowAppear = false
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
        
    }
    
    func MoveArrow (Sindex: Int){
        let stackWidth: CGFloat!
        let ArrowWidth:CGFloat!
        
        stackWidth = Options.frame.size.width
        let elementWidth = stackWidth / CGFloat(Options.arrangedSubviews.count )
        let curElementLocation = elementWidth * CGFloat (Sindex) + (CGFloat((Sindex - 2) * 4) )
        
        ArrowWidth = Arrow.frame.size.width
        let xLocation = Options.frame.origin.x + curElementLocation + ( elementWidth / 2.0) - (ArrowWidth / 2.0)
        let ArrowHeight: CGFloat!
        ArrowHeight = Arrow.frame.size.height
        let yLocation = Options.frame.origin.y - ArrowHeight - 3
        if ArrowAppear{
            Arrow.isHidden = false
        }
        Arrow.frame.origin = CGPoint(x: xLocation , y: yLocation)
    }
    
    func arrowAppearance(val: Bool){
        ArrowAppear = val
    }

}


