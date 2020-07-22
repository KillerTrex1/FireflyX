//
//  Song.swift
//  FireflyX
//
//  Created by admin on 2/15/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class Song{
    var notes: [Note]
    var tempo: Double
    var repetitions: Int
    init(notes:[Note],tempo:Double,repetitions:Int){
        self.notes = notes
        self.tempo = tempo
        self.repetitions = repetitions
    }
    func getNotes()->[Note]{
        return notes
    }
    func getTempo()->Double{
        return tempo
    }
    func getRepetitions()->Int{
        return repetitions
    }
    func getRepeatedNotes()->[Note]{
        var repeatedNotes = [Note]()
        for _ in 0 ..< repetitions{
            for j in 0 ..< notes.count{
                repeatedNotes.append(notes[j])
            }
        }
        return repeatedNotes
    }
    func removePitch(){
        for note in notes{
            note.changePitch(pitchIndex: -1)
            
        }
    }
    
}
