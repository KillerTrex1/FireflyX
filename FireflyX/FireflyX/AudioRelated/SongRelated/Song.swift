//
//  Song.swift
//  FireflyX
//
//  Created by admin on 2/15/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class Song:Codable{
    var notes: [Note]
    var firefly: Firefly
    init(notes:[Note], fFly: Firefly){
        self.notes = notes
        firefly = fFly
    }
    func getNotes()->[Note]{
        return notes
    }
    func getTempo()->Double{
        return firefly.getBody().getTempo()
    }
    func getRepetitions()->Int{
        return firefly.getWing().getRepetitions()
    }
    func changeFireflyTempo(color:Colors){
        firefly.getBody().setColor(color: color)
    }
    func getRepeatedNotes()->[Note]{
        var repeatedNotes = [Note]()
        for _ in 0 ..< getRepetitions(){
            repeatedNotes+=notes
        }
        return repeatedNotes
    }
    func removePitch(){
        for note in notes{
            note.changePitch(pitchIndex: -1)
            
        }
    }
    func getFirefly()->Firefly{
        return firefly
    }
    func getPitchPattern()->String{
        var pp = notes[0].convertPitchToString()
        for i in 1..<notes.count{
            pp =  "\(pp) \(notes[i].convertPitchToString())"
        }
        return pp
    }
    
}
