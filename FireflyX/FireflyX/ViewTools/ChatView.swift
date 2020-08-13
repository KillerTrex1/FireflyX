//
//  ChatView.swift
//  FireflyX
//
//  Created by admin on 7/28/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class ChatView{
    var usedAlready: Bool
    var showChat: Bool
    var Chat: UIImageView
    init(chatImage: UIImageView){
        Chat = chatImage
        showChat = true
        usedAlready = false
    }
    func chatChangeHead(bodyTemp: String){
        Chat.isHidden = !showChat
        Chat.image = UIImage(named: "\(bodyTemp)Chat")
    }
    
    func chatChangeFNote(num: Int, bodyTemp: String){
        Chat.isHidden = !showChat
        Chat.image = UIImage(named: "\(bodyTemp)N\(num)Chat")
    }
    func chatChangeFNoteRest(num: Int,bodyTemp: String){
        Chat.isHidden = !showChat
        Chat.image = UIImage(named: "\(bodyTemp)R\(num)Chat")
    }
    func chatChangeLeverToNote(bodyTemp: String){
        Chat.isHidden = !showChat
        Chat.image = UIImage(named: "\(bodyTemp)RtoL")
    }
    func chatChangeLeverToRest(bodyTemp: String){
        Chat.isHidden = !showChat
        Chat.image = UIImage(named: "\(bodyTemp)LtoR")
    }
    func chatChangeSize(num:Int,bodyTemp: String){
        Chat.isHidden = !showChat
        Chat.image = UIImage(named: "\(bodyTemp)S\(num)Chat")
    }
    func hideShowChat()->Bool{
        showChat = !showChat
        Chat.isHidden = !showChat
        return showChat
    }
    
    func forcedHideChat(){
        Chat.isHidden = true
    }
    
    func forcedShowChat(){
        Chat.isHidden = !showChat
    }
    func used(){
        usedAlready = true
    }
    func reset(){
        usedAlready = false
    }
    
}
