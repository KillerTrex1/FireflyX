//
//  Animation.swift
//  FireflyX
//
//  Created by admin on 2/24/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class FireflyAnimator {
    static var fireflyImage: UIImageView!
    static var fireflyAnimations: [UIImage] = []
    static var fireflyImageSupport: UIImageView!
    static var mode = false
    
    static func setImage(flyImageView:UIImageView, support: UIImageView){
        fireflyImage = flyImageView
        fireflyImageSupport = support
    }
    static func setIarray(ImageCount:Int,ImagePrefix:String){
        var imageArray: [UIImage] = []
        for i in 1..<ImageCount{

            let newImage = UIImage(named: "\(ImagePrefix)\(i)")!
            imageArray.append(newImage)
        }
        
        fireflyAnimations = imageArray
    }
    static func animateImage(duration:Double){
        
        fireflyImage.animationImages = fireflyAnimations
        fireflyImage.animationDuration = duration
        fireflyImage.animationRepeatCount = -1
        fireflyImage.startAnimating()
        
    }
    static func animateImageOnce(duration:Double){
        mode = !mode
        if mode{
            animateMode(animated: fireflyImage, hidden: fireflyImageSupport, Aduration: duration)
        }else{
            animateMode(animated: fireflyImageSupport, hidden: fireflyImage, Aduration: duration)
        }
        
    }
    static func animateMode(animated: UIImageView, hidden: UIImageView,Aduration:Double){
        hidden.stopAnimating()
        hidden.isHidden = true
        animated.isHidden = false
        animated.animationImages = fireflyAnimations
        animated.animationDuration = Aduration
        animated.animationRepeatCount = 1
        animated.startAnimating()
    }
    /*
    static func ResetAnimate(){
        fireflyImage.animationImages = fireflyAnimations
        fireflyImage.animationDuration = 4.0
        fireflyImage.animationRepeatCount = 1
        fireflyImage.startAnimating()
        fireflyImage.stopAnimating()
        
    }
 */
}
