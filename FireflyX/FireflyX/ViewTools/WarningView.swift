//
//  Warning.swift
//  FireflyX
//
//  Created by admin on 8/14/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class WarningView{
    var Warning: UIImageView!
    var Yes: UIButton!
    var No: UIButton!
    var BRBG: UIButton!
    var Ok: UIButton!
    /*
    0 no playback ok
    1 next fly yesno
    2 task 2 ok
    3 color yesno
    4 nojarload ok
    5 new jar yesno
    6 exit yesno
    */
    var modes = [false,false,false,false,false,false,false]
    init(warn: UIImageView, yes: UIButton, no: UIButton, bg: UIButton, ok: UIButton){
        Warning = warn
        Yes = yes
        No = no
        BRBG = bg
        Ok = ok
    }
    func bringToFront(view: UIView){
        view.bringSubviewToFront(Warning)
        view.bringSubviewToFront(Yes)
        view.bringSubviewToFront(No)
        view.bringSubviewToFront(Ok)
    }
    func showWarn(mode: Int){
        modes[mode] = true
        Warning.image = UIImage(named: "Warn\(mode)")
        switch(mode){
        case 0, 2, 4:
            showWarnOk()
        default:
            showWarnYesNo()
        }
        
    }
    
    func showWarnYesNo(){
        
        BRBG.isHidden = false
        Yes.isHidden = false
        No.isHidden = false
        Warning.isHidden = false
    }
    func showWarnOk(){
        BRBG.isHidden = false
        Ok.isHidden = false
        print(Ok.isHidden)
        Warning.isHidden = false
    }
    
    func endWarn(){
        modes[getWarnMode()] = false
        hideWarn()
    }
    func hideWarn(){
        BRBG.isHidden = true
        Yes.isHidden = true
        No.isHidden = true
        Ok.isHidden = true
        Warning.isHidden = true
    }
    func getWarnMode()->Int{
        for i in 0..<modes.count{
            if modes[i]{
                print(i)
                return i
            }
        }
        return 0
    }
}
