//
//  PitchSlot.swift
//  FireflyX
//
//  Created by admin on 4/21/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class PitchSlot{
    var taken: Bool!
    var pitchSlot: UIImageView!
    var edgeLine: UIImageView!
    var isEdge: Bool!
    var fireflyImage: UIImage!
    
    init(pitchslot: UIImageView){
        self.pitchSlot = pitchslot
        taken = false
        isEdge = false
    }
    init(pitchslot: UIImageView,edgeLine: UIImageView){
        self.pitchSlot = pitchslot
        self.edgeLine = edgeLine
        taken = false
        isEdge = true
        self.edgeLine.center = self.pitchSlot.center
        //self.edgeLine.frame.width = self.edgeLine.frame.width * 1.5
    }

    func showSlot(){
        if(!taken){
            //pitchSlot.image = slotImage
            pitchSlot.isHidden = false
        }
        
    }
    
    func hideslot(){
        pitchSlot.isHidden = true
    }
    
    
    func takeSlot(){
        pitchSlot.isHidden = true

        if isEdge {
            edgeLine.isHidden = false
        }
        taken = true
    }
    
    
    func freeSlot(){
        if(taken){
            if isEdge {
                edgeLine.isHidden = true
            }
            taken = false
        }
        
    }

    

    

}
