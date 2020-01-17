//
//  Wing.swift
//  FireflyX
//
//  Created by Mart on 14/01/2020.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class Wing{
    var notePattern: String
    var repetitions: Int
    
    init(){
        notePattern = ""
        repetitions = 1
    }
    
    func setNotePattern(notePattern:String){
        self.notePattern = notePattern
    }
    func setRepetitions(repetitions:Int){
        self.repetitions = repetitions
    }
    func getNotePattern()->String{
        return self.notePattern
    }
    func getRepetitions()->Int{
        return self.repetitions
    }
    
}
