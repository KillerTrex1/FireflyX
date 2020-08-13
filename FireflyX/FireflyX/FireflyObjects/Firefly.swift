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
    var seqno : Int
    
    init(){
        body = Body()
        wing = Wing()
        tail = Tail()
        seqno = 1
    }
    init(nBody:Body,nWing:Wing,nTail:Tail){
        body = nBody
        wing = nWing
        tail = nTail
        seqno = 1
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
    func setSeqno(seqno:Int){
        self.seqno = seqno
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
    func getSeqno()->Int{
        return seqno
    }
    
}
