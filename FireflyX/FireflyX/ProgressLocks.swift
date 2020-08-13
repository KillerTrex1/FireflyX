//
//  ProgressLocks.swift
//  FireflyX
//
//  Created by admin on 7/28/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class ProgressLocks{
    var winglock:Bool
    var tail1lock:Bool
    var tail2lock:Bool
    var playlock:Bool
    init(){
        winglock = true
        tail1lock = true
        tail2lock = true
        playlock = true
    }
    func reset(){
        winglock = true
        tail1lock = true
        tail2lock = true
        playlock = true
    }
    func unlockW()->Bool{
        if winglock{
            winglock = false
            return true
        }
        return false
    }
    func unlockT1()->Bool{
        if tail1lock{
            tail1lock = false
            return true
        }
        return false
    }
    func unlockT2()->Bool{
        if tail2lock{
            tail2lock = false
            return true
        }
        return false
    }
    func checkT()->Bool{
        if !tail1lock && !tail2lock{
            return true
        }
        return false
    }
    func unlockP()->Bool{
        if playlock{
            playlock = false
            return true
        }
        return false
    }
    func checkP()->Bool{
        return playlock
    }
    
    
}
