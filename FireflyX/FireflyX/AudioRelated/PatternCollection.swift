//
//  PatternCollection.swift
//  FireflyX
//
//  Created by admin on 2/19/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class PatternCollection{
    static let firstNoteWr = "Wr"
    
    static let firstNoteW = "W"
    
    static let firstNoteHr = ["Hr Qr Q","Hr Q Qr","Hr E E Q", "Hr E Er Q","Hr E E E E"]
    
    static let firstNoteH = ["H Hr","H H","H Q Q", "H Q E E","H Qr E E"]
    
    static let firstNoteQr = ["Qr Q Hr","Qr H Qr","Qr Q Qr Q", "Qr Q Q Qr","Qr E E Qr E E"]
    
    //static let firstNoteQ = ["Q Q Hr","Q H Qr","Q Q Qr Q", "Q Q Q Qr","Q E E Qr E E"]'
    static let firstNoteQ = ["Q Q H","Q Qr Q Qr","Q Q Q Q", "Q Qr E E Qr","Q E E Q Q"]
    
    static let firstNoteEr = ["Er H Qr E", "Er E Q Qr Q", "Er E Hr E E","Er E Er E Er E Q","Er E E E Er E Q"]
    
    static let firstNoteE = ["E E Q H", "E Q E Q Q", "E E E E H", "E E E E Q Q", "E E E E E E E E"]
    
    
    static func getBeatString(noteType: NoteType, index:Int)->String{
        switch noteType{
        case .wholeRest:
            return firstNoteWr
        case .whole:
            return firstNoteW
        case .halfRest:
            return firstNoteHr[index]
        case .half:
            return firstNoteH[index]
        case .quarterRest:
            return firstNoteQr[index]
        case .quarter:
            return firstNoteQ[index]
        case .eighthRest:
            return firstNoteEr[index]
        default:
            return firstNoteE[index]
        }
    }
}
   
