//
//  View.swift
//  FireflyX
//
//  Created by admin on 2/29/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class View{
    static var fireflyMain: UIImageView!
    static var BodyWood: UIImageView!
    static var wing1Wood: UIImageView!
    static var wing2Wood: UIImageView!
    static var tailWood: UIImageView!
    static var dot1: UIImageView!
    static var dot2: UIImageView!
    static var dot3: UIImageView!
    static var dot4: UIImageView!
    static var bodyOptions: UIStackView!
    static var wing1Options: UIStackView!
    static var wing2Options: UIStackView!
    static var tailOptions: UIStackView!
    static var play: UIButton!
    static var headTouch: UIButton!
    static var wing1Touch: UIButton!
    static var wing2Touch: UIButton!
    static var lever: UIButton!
    static var tailTouch: UIButton!
    static var arrow1: UIImageView!
    static var arrow2: UIImageView!
    
    static func setMainImages(firefly : UIImageView, body : UIImageView, wing1 : UIImageView, wing2 : UIImageView,tail:UIImageView){
        fireflyMain = firefly
        BodyWood = body
        wing1Wood = wing1
        wing2Wood = wing2
        tailWood = tail
    }
    static func setDots(dotTop:UIImageView, dotWing1:UIImageView, dotWing2:UIImageView, dotTail:UIImageView){
        dot1 = dotTop
        dot2 = dotWing1
        dot3 = dotWing2
        dot4 = dotTail
    }
    static func setOptionStacks(bOptions:UIStackView, w1Options:UIStackView, w2Options:UIStackView, tOptions:UIStackView){
        bodyOptions = bOptions
        wing1Options = w1Options
        wing2Options = w2Options
        tailOptions = tOptions
    }
    static func setButtons(playButton:UIButton, headArea: UIButton, wing1Area: UIButton, wing2Area: UIButton,rLever: UIButton ,tailArea: UIButton){
        play = playButton
        headTouch = headArea
        wing1Touch = wing1Area
        wing2Touch = wing2Area
        lever = rLever
        tailTouch = tailArea
        
    }
    static func setArrow(wingArrow: UIImageView, tailArrow: UIImageView){
        arrow1 = wingArrow
        arrow2 = tailArrow
    }
    static func hidePanels(val:Bool){
        BodyWood.isHidden = val
        wing1Wood.isHidden = val
        wing2Wood.isHidden = val
        tailWood.isHidden = val
        arrow1.isHidden = val
        arrow2.isHidden = val
        //dot1.isHidden = val
        //dot2.isHidden = val
        //dot3.isHidden = val
        //dot4.isHidden = val
        bodyOptions.isHidden = val
        wing1Options.isHidden = val
        wing2Options.isHidden = val
        lever.isHidden = val
        tailOptions.isHidden = val
        //play.isHidden = val
        headTouch.isHidden = val
        wing1Touch.isHidden = val
        wing2Touch.isHidden = val
        tailTouch.isHidden = val
        
    }
    static func hideAll(val:Bool){
        fireflyMain.isHidden = val
        hidePanels(val: val)
    }
    static func fireflySetup(){
        
    }
}
