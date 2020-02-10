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
    var tempo : Tempos
    
    init(){
        color = .Red
        tempo = Tempolookup(color: self.color)
        
    }
    
    func setTempo(tempo:Tempos){
        self.tempo = tempo
    }
    func setColor(color:Colors){
        self.color = color
        setTempo(tempo: Tempolookup(color: self.color))
    }
    func getTempo()->Int{
        return tempo.hashValue
    }
    func getColor()->Colors{
        return self.color
    }
    
}
