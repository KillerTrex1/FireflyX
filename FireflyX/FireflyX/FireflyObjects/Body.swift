//
//  Body.swift
//  FireflyX
//
//  Created by Mart on 14/01/2020.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class Body{
    var color : Colors
    var tempo : Double
    
    init(){
        color = .Yellow
        tempo = Lookups.tempoLookup(color: self.color)
        
    }
    init(color:Colors){
        self.color = color
        tempo = Lookups.tempoLookup(color: self.color)
    }
    
    func setTempo(tempo:Double){
        self.tempo = tempo
    }
    func setColor(color:Colors){
        self.color = color
        setTempo(tempo: Lookups.tempoLookup(color: self.color))
    }
    func getTempo()->Double{
        return tempo
    }
    func getColor()->Colors{
        return self.color
    }
    
}
