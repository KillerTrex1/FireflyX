//
//  Tail.swift
//  FireflyX
//
//  Created by Mart on 14/01/2020.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class Tail: Codable{
    var beatPattern: String
    var beatIndex: Int
    //var pitchPattern: String
    
    init(){
        beatPattern = ""
        beatIndex = -1
        //pitchPattern = ""
    }
    
    /*
    func setBlinkPattern(blinkPattern:String){
        self.beatPattern = blinkPattern
    }
    */
    func setBeatPattern(beatType:NoteType, Bindex:Int){
        if beatType == .whole || beatType == .wholeRest{
            beatIndex = 0
        }else{
            beatIndex = Bindex
        }
        beatPattern = PatternCollection.getBeatString(noteType: beatType, index: Bindex)
        print(beatPattern)
    }
    //func setPitchPattern(trail:Trail)
    func getBeatPattern()->String{
        return self.beatPattern
    }
    func getBeatIndex()->Int{
        return beatIndex
    }
    /*
    func getColor()->String{
        return self.pitchPattern
    }
 */
    
}
