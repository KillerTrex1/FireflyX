//
//  Tail.swift
//  FireflyX
//
//  Created by Mart on 14/01/2020.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class Tail{
    var beatPattern: String
    var pitchPattern: String
    
    init(){
        beatPattern = ""
        pitchPattern = ""
    }
    
    func setBlinkPattern(blinkPattern:String){
        self.beatPattern = blinkPattern
    }
    func setBeatPattern(beatType:NoteType, Bindex:Int){
        beatPattern = PatternCollection.getBeatString(noteType: beatType, index: Bindex)
        
    }
    //func setPitchPattern(trail:Trail)
    func getBeatPattern()->String{
        return self.beatPattern
    }
    func getColor()->String{
        return self.pitchPattern
    }
    
}
