//
//  TempoLookup.swift
//  FireflyX
//
//  Created by Mart on 14/01/2020.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class Lookups{
    static func tempoLookup(color:Colors)->Double{
        switch color{
        case .Red:
            return 25.0
        //case .Orange:
        //    return 40.0
        case .Yellow:
            return 60.0
        /*
        case .Green:
            return 66.0
        
        case .Blue:
            return 76.0
        case .Indigo:
            return 108.0
        */
        default:
            return 66.0
            
            
        }
    }
    static func colorsLookup(color:String)->Colors{
        switch color{
        case "R":
            return .Red
        //case "O":
            //return .Orange
        case "Y":
            return .Yellow
        /*
        case "G":
            return .Green
        
        case "B":
            return .Blue
        case "I":
            return .Indigo
        */
        default:
            //return .Violet
            return .Green
        }
    }
}

