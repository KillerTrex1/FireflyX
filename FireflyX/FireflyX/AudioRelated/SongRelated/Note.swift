//
//  Note.swift
//  FireflyX
//
//  Created by admin on 2/14/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation


class Note:Codable{ 
    var type:NoteType
    var value:Int
    var pitch:Pitch
    //512
    //256
    //128
    //64
    init (type: NoteType, pitch:Pitch) {
        
        value = Lookups.NoteValueLookup(type: type)
        self.pitch = pitch
        self.type = type
    }
    func isRest() ->Bool{
        switch type{
            case .eighthRest,.halfRest,.quarterRest,.wholeRest:
                return true
            default:
                return false
        }
        
    }
    func changePitch(pitchIndex: Int){
        let pitch: Pitch
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
    func getPitchIndex() -> Int {
        
        
        var index = 0
        
        switch self.pitch {
        case .C:
            index = 12
        case .D:
            index = 11
        case .E:
            index = 10
        case .F:
            index = 9
        case .G:
            index = 8
        case .A:
            index = 7
        case .B:
            index = 6
        case .CH:
            index = 5
        case .DH:
            index = 4
        case .EH:
            index = 3
        case .FH:
            index = 2
        case .GH:
            index = 1
        default:
            index = 0

        }
        
        return index
    }
    func convertToMIDI()->Int{
        // all values here are in 4th octave
        var MIDINum = 0
        
        switch self.pitch {
        case .C:
            //MIDINum = 60
            MIDINum = 63
        case .D:
            //MIDINum = 62
            MIDINum = 65
            //
        case .E:
            MIDINum = 67
            //MIDINum = 64
        case .F:
            MIDINum = 68
            //MIDINum = 65
        case .G:
            MIDINum = 70
            //MIDINum = 67
        case .A:
            MIDINum = 72
            //MIDINum = 69
        case .B:
            MIDINum = 74
            //MIDINum = 71
        case .CH:
            MIDINum = 75
            //MIDINum = 72
        case .DH:
            MIDINum = 77
            //MIDINum = 74
        case .EH:
            MIDINum = 79
            //MIDINum = 76
        case .FH:
            MIDINum = 80
            //MIDINum = 77
        case .GH:
            MIDINum = 82
            //MIDINum = 79
        default:
            MIDINum = 84
            //MIDINum = 81

        }
        
        return MIDINum
    }
    func convertPitchToString()->String{
        // all values here are in 4th octave
        var noteS: String
        
        switch self.pitch {
        case .C:
            //MIDINum = 60
            noteS = "C"
        case .D:
            //MIDINum = 62
            noteS = "D"
            //
        case .E:
            noteS = "E"
            //MIDINum = 64
        case .F:
            noteS = "F"
            //MIDINum = 65
        case .G:
            noteS = "G"
            //MIDINum = 67
        case .A:
            noteS = "A"
            //MIDINum = 69
        case .B:
            noteS = "B"
            //MIDINum = 71
        case .CH:
            noteS = "C"
            //MIDINum = 72
        case .DH:
            noteS = "DH"
            //MIDINum = 74
        case .EH:
            noteS = "EH"
            //MIDINum = 76
        case .FH:
            noteS = "FH"
            //MIDINum = 77
        case .GH:
            noteS = "GH"
            //MIDINum = 79
        default:
            noteS = "AH"
            //MIDINum = 81
        }
        
        return noteS
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

