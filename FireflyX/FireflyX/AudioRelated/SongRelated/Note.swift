//
//  Note.swift
//  FireflyX
//
//  Created by admin on 2/14/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation


class Note {
    var type:NoteType
    var value:Int
    var pitch:Pitch
    
    init (type: NoteType, pitch:Pitch) {
        switch type {
        case .whole,
             .wholeRest:
            value = 512
        case .half,
             .halfRest:
            value = 256
        case .quarter,
             .quarterRest:
            value = 128
        case .eighth,
             .eighthRest:
            value = 64
        }
        
        self.pitch = pitch
        self.type = type
    }
    
    func convertToMIDI() -> Int {
        // all values here are in 4th octave
        
        var MIDINum = 0
        
        switch self.pitch {
        case .C:
            MIDINum = 60
        case .D:
            MIDINum = 62
        case .E:
            MIDINum = 64
        case .F:
            MIDINum = 65
        case .G:
            MIDINum = 67
        case .A:
            MIDINum = 69
        case .B:
            MIDINum = 71
        default:
            MIDINum = 0
        }
        
        return MIDINum
    }
    func convertBeat() -> String {
        
        switch self.type {
        case .whole:
            return "W"
        case .wholeRest:
            return "Wr"
        case .half:
            return "H"
        case .halfRest:
            return "Hr"
        case .quarter:
            return "Q"
        case .quarterRest:
            return "Qr"
        case .eighth:
            return "E"
        default:
            return "Er"
        }

    }
}

