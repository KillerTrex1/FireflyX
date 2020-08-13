//
//  BodyOptionsView.swift
//  FireflyX
//
//  Created by admin on 3/12/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class OptionsView {
    var Background: UIImageView!
    var Options: UIStackView!
    
    init(bg:UIImageView, stack: UIStackView){
        Background = bg
        Options = stack
    }


    func toggle(val: Bool){
        Options.isHidden = val
        Background.isHidden = val
    }

}
