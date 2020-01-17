//
//  Tail.swift
//  FireflyX
//
//  Created by Mart on 14/01/2020.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class Tail{
    var blinkPattern: String
    var pitchPattern: String
    
    init(){
        blinkPattern = ""
        pitchPattern = ""
    }
    
    func setBlinkPattern(blinkPattern:String){
        self.blinkPattern = blinkPattern
    }
    //func setPitchPattern(trail:Trail)
    func getBlinkPattern()->String{
        return self.blinkPattern
    }
    func getColor()->String{
        return self.pitchPattern
    }
    
}
