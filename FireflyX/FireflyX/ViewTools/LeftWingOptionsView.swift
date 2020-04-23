//
//  LeftWingOptionsView.swift
//  FireflyX
//
//  Created by admin on 3/12/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class LeftWingOptionsView {
    static var lWingBackground: UIImageView!
    static var lWingOptions: UIStackView!
    static var lever: UIButton!
    
    static func setLImage(bg:UIImageView, stack: UIStackView){
        lWingBackground = bg
        lWingOptions = stack
    }


    static func toggleLeftWing(){
        lWingOptions.isHidden = !lWingOptions.isHidden
        lWingBackground.isHidden = !lWingOptions.isHidden
        lever.isHidden = !lever.isHidden
    }

}
