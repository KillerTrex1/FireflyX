//
//  Firefly.swift
//  FireflyX
//
//  Created by Mart on 14/01/2020.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class Firefly: Codable{
    
    var body : Body
    var wing : Wing
    var tail : Tail

    
    init(){
        body = Body()
        wing = Wing()
        tail = Tail()

    }
    init(nBody:Body,nWing:Wing,nTail:Tail){
        body = nBody
        wing = nWing
        tail = nTail

    }
    func setBody(body:Body){
        self.body = body
    }
    func setWing(wing:Wing){
        self.wing = wing
    }
    func setTail(tail:Tail){
        self.tail = tail
    }
    func getBody()->Body{
        return body
    }
    func getWing()->Wing{
        return wing
    }
    func getTail()->Tail{
        return tail
    }

    
}
