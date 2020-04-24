//
//  BodyOptionsView.swift
//  FireflyX
//
//  Created by admin on 3/12/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class BodyOptionsView {
    static var bodyBackground: UIImageView!
    static var bodyOptions: UIStackView!
    
    static func setRImage(bg:UIImageView, stack: UIStackView){
        bodyBackground = bg
        bodyOptions = stack
    }


    static func toggleRightWing(){
        bodyOptions.isHidden = !bodyOptions.isHidden
        bodyBackground.isHidden = !bodyOptions.isHidden
    }

}
