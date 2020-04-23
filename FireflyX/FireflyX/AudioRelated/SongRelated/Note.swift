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
    //512
    //256
    //128
    //64
    init (type: NoteType, pitch:Pitch) {
        switch type {
        case .whole,
             .wholeRest:
            value = 8
        case .half,
             .halfRest:
            value = 4
        case .quarter,
             .quarterRest:
            value = 2
        case .eighth,
             .eighthRest:
            value = 1
        }
        
        self.pitch = pitch
        self.type = type
    }
    func changePitch(pitchIndex: Int){
        var pitch: Pitch
        switch pitchIndex{
            case 0:
                pitch = .AH
            case 1:
                pitch = .GH
            case 2:
                pitch = .FH
            case 3:
                pitch = .EH
            case 4:
                pitch = .DH
            case 5:
                pitch = .CH
            case 6:
                pitch = .B
            case 7:
                pitch = .A
            case 8:
                pitch = .G
            case 9:
                pitch = .F
            case 10:
                pitch = .E
            case 11:
                pitch = .D
            default:
                pitch = .C
        }
        self.pitch = pitch
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
        case .CH:
            MIDINum = 72
        case .DH:
            MIDINum = 74
        case .EH:
            MIDINum = 76
        case .FH:
            MIDINum = 77
        case .GH:
            MIDINum = 79
        case .AH:
            MIDINum = 81
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
    func getValue()->Int{
        return value
    }
}

