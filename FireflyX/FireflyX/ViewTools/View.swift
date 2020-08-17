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
    static var FireflyImage: UIImageView!
    static var BodyOptions: OptionsView!
    static var Wing1Options: OptionsView!
    static var Wing2Options: OptionsWithLeverAndArrows!
    static var TailOptions: OptionsWithArrowsView!
    static var FeedBtn: UIButton!
    static var BDotArea: DotAndTouchArea!
    static var W1DotArea: DotAndTouchArea!
    static var W2DotArea: DotAndTouchArea!
    static var TDotArea: DotAndTouchArea!
    static var TailPreview: UIImageView!
    static var JarFlies: JarFirefliesView!
    static var JarCork: UIButton!
    static var JarBody: UIImageView!
    
    static func setMainImages(firefly : UIImageView, body : UIImageView, wing1 : UIImageView, wing2 : UIImageView,tail:UIImageView,wingArrow: UIImageView, tailArrow: UIImageView, rLever: UIButton, bOptions:UIStackView, w1Options:UIStackView, w2Options:UIStackView, tOptions:UIStackView, tailPreview: UIImageView){
        FireflyImage = firefly
        TailPreview = tailPreview
        
        
        BodyOptions = OptionsView(bg: body, stack: bOptions)
        Wing1Options = OptionsView(bg: wing1, stack: w1Options)
        Wing2Options = OptionsWithLeverAndArrows(bg: wing2, stack: w2Options,arrow: wingArrow,lever: rLever)
        TailOptions = OptionsWithArrowsView(bg: tail, stack: tOptions, arrow: tailArrow)

    }
    
    static func setButtonsAndDots(feedButton:UIButton, headArea: UIButton, wing1Area: UIButton, wing2Area: UIButton,tailArea: UIButton,dotTop:UIImageView, dotWing1:UIImageView, dotWing2:UIImageView, dotTail:UIImageView){
        FeedBtn = feedButton
        
        BDotArea = DotAndTouchArea(dot: dotTop, area: headArea)
        W1DotArea = DotAndTouchArea(dot: dotWing1, area: wing1Area)
        W2DotArea = DotAndTouchArea(dot: dotWing2, area: wing2Area)
        TDotArea = DotAndTouchArea(dot: dotTail, area: tailArea)
        
    }
    static func setJarStuff(JF: JarFirefliesView,Cork: UIButton, JB: UIImageView){
        JarFlies = JF
        JarCork = Cork
        JarBody = JB
    }
    static func hideCork(val: Bool){
        JarCork.isHidden = val
    }
    static func hideJarStuffForPreview(val:Bool){
        JarCork.isHidden = val
        JarBody.isHidden = val
        if val{
            JarFlies.saveStateThenHide()
        }else{
            JarFlies.loadPreviousState()
        }
    }
    static func hidePanels(val:Bool){

        BodyOptions.toggle(val: val)
        Wing1Options.toggle(val: val)
        Wing2Options.toggle(val: val)
        TailOptions.toggle(val: val)
        
        BDotArea.toggleArea(val: val)
        W1DotArea.toggleArea(val: val)
        W2DotArea.toggleArea(val: val)
        TDotArea.toggleArea(val: val)
        toggleFeed(val: val)

    }
    static func jarFlyAppear(index: Int){
        JarFlies.hideFly(index: index, val: false)
    }

    static func toggleBodyTouch(val:Bool){
        BDotArea.toggle(val: val)
    }
    static func toggleWing1Touch(val:Bool){
        W1DotArea.toggle(val: val)
    }
    static func toggleWing2Touch(val:Bool){
        W2DotArea.toggle(val: val)
    }
    static func toggleTailTouch(val:Bool){
        TDotArea.toggle(val: val)
    }
    static func toggleBodyDot(val:Bool){
        BDotArea.toggleDot(val: val)
    }
    static func toggleW1Dot(val:Bool){
        W1DotArea.toggleDot(val: val)
    }
    static func toggleW2Dot(val:Bool){
        W2DotArea.toggleDot(val: val)
    }
    static func toggleTDot(val:Bool){
        TDotArea.toggleDot(val: val)
    }
    static func toggleBody(val : Bool){
        BodyOptions.toggle(val: val)
    }
    
    static func toggleWing1(val : Bool){
        Wing1Options.toggle(val: val)
    }
    static func toggleWing2(val : Bool){
        Wing2Options.toggle(val: val)
    }
    static func toggleTail(val : Bool){
        TailOptions.toggle(val: val)
    }
    static func tailArrowAppear(val:Bool){
        TailOptions.arrowAppearance(val: val)
    }
    static func wingArrowAppear(val:Bool){
        Wing2Options.arrowAppearance(val: val)
    }
    static func moveTailArrow(Sindex: Int){
        TailOptions.MoveArrow(Sindex: Sindex)
    }
    static func moveWingArrow(Sindex: Int){
        Wing2Options.MoveArrow(Sindex: Sindex)
    }
    static func toggleFeed(val:Bool){
        FeedBtn.isHidden = val
        TailPreview.isHidden = val
    }
    static func changeTailPreview(isRest:Bool,NoteValue: Int, BeatIndex: Int){
        if isRest{
            TailPreview.image = UIImage(named: "PR\(NoteValue)\(BeatIndex)")
        }else{
            TailPreview.image = UIImage(named: "P\(NoteValue)\(BeatIndex)")
        }
    }
    
    
    static func hideAll(val:Bool){
        FireflyImage.isHidden = val
        hidePanels(val: val)
        
    }
    /*
    static func UpdateImage(bodyTemp:Int, wingTemp: Int){
           //FireflyAnimator.ResetAnimate()
        var fireflyPic: UIImage!
        if  restToggle{
            fireflyPic = UIImage(named: "\(bodyTemp)W\(wingTemp)T1R")
            FireflyImage.image = fireflyPic
            FireflyAnimator.setAnimationMode(isRest: true)
               
            PitchView.getPitchFly().image = fireflyPic
                //PitchFly.image = fireflyPic
            MovingPitchFly.image = UIImage(named: "\(bodyTemp)W1T1R")
    
        }else{
            fireflyPic = UIImage(named: "\(bodyTemp)W\(wingTemp)T1")
            
            FireflyImage.image = fireflyPic
            FireflyAnimator.setAnimationMode(isRest: false)

               
            PitchFly.image = fireflyPic
            MovingPitchFly.image = UIImage(named: "\(bodyTemp)W1T1")
        }
        FireflyAnimator.setOGImage(image: fireflyPic)
           //FireFlySupport.center = PitchFly.center
        var pic: UIImage!
        pic = UIImage(named: "\(bodyTemp)W\(wingTemp)T1R")
        FireflyAnimator.setRestImage(image: pic)
           
        let prefix = "\(bodyTemp)W\(wingTemp)C"
        FireflyAnimator.setIarray(ImageCount: 8, ImagePrefix: prefix)
           
       }
 */
}
