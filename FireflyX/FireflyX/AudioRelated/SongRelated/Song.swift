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
    
}
