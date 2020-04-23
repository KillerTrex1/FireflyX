//
//  RightWingOptionsView.swift
//  FireflyX
//
//  Created by admin on 3/12/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class RightWingOptionsView {
    static var rWingBackground: UIImageView!
    static var rWingOptions: UIStackView!
    
    static func setRImage(bg:UIImageView, stack: UIStackView){
        rWingBackground = bg
        rWingOptions = stack
    }


    static func toggleRightWing(){
        rWingOptions.isHidden = !rWingOptions.isHidden
        rWingBackground.isHidden = !rWingOptions.isHidden
    }

}
