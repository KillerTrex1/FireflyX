//
//  Wing.swift
//  FireflyX
//
//  Created by Mart on 14/01/2020.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class Wing: Codable{
    var firstNote: NoteType
    var repetitions: Int
    
    init(){
        firstNote = .half
        repetitions = 1
    }
    init(note:NoteType,rep:Int){
        self.firstNote = note
        self.repetitions = rep
    }
    
    func setFirstNote(note:NoteType){
        self.firstNote = note
    }
    func setRepetitions(repetitions:Int){
        self.repetitions = repetitions
    }
    func getNFirstNote()->NoteType{
        return self.firstNote
    }
    func getRepetitions()->Int{
        return self.repetitions
    }
    
}
