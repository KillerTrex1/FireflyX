//
//  DotAndTouchArea.swift
//  FireflyX
//
//  Created by admin on 7/29/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit

class DotAndTouchArea{
    var dot: UIImageView
    var area: UIButton
    init(dot:UIImageView, area:UIButton){
        self.dot = dot
        self.area = area
    }
    func toggle(val: Bool){
        dot.isHidden = val
        area.isHidden = val
        
    }
    
    func toggleDot(val: Bool){
        dot.isHidden = val
    }
    
    func toggleArea(val: Bool){
        
        area.isHidden = val
        if val{
            dot.isHidden = val
        }
    }
}
