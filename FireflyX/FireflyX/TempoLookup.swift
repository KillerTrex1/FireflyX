//
//  TempoLookup.swift
//  FireflyX
//
//  Created by Mart on 14/01/2020.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
func Tempolookup(color:Colors)->Tempos{
    switch color{
    case .Red:
        return .T1
    case .Orange:
        return  .T2
    case .Yellow:
        return .T3
    case .Green:
        return .T4
    case .Blue:
        return .T5
    case .Indigo:
        return .T6
    default:
        return .T7
    }
}
