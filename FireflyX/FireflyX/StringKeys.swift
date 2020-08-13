//
//  SaveLoadKeys.swift
//  FireflyX
//
//  Created by admin on 8/12/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class StringKeys{
    
    static var KeyStart = "Task"
    static var MainToMenu = "TaskMenu"
    static var MainToLoad = "Load"
    static func KeyForJars(task: Int)->String{
        return "\(KeyStart)\(task)J"
    }
    
    
    
}
