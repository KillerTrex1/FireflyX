//
//  Pause Menu.swift
//  FireflyX
//
//  Created by admin on 7/30/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class PauseMenuView{
    var BRBG: UIButton!
    var PauseBG: UIImageView!
    //var HelpBtn: UIButton!
    var LoadBtn: UIButton!
    var SettingsBtn: UIButton!
    var ToggleChatText: UIImageView!
    var ToggleWingOptionsText: UIImageView!
    var ToggleChatBtn: UIButton!
    var ToggleWingOptionsBtn: UIButton!
    var ExitBtn: UIButton!
    var XBtn: UIButton!
    var pauseMode: Bool!
    var NameText: UITextField!
    var ConfirmButton: UIButton!
    var startMode: Bool!
    var NameBG: UIImageView!
    init(brbg: UIButton, bg: UIImageView, load:UIButton, set: UIButton, toggleC: UIImageView, toggleW: UIImageView, toggleCBtn:UIButton, toggleWBtn: UIButton, exit: UIButton, x:UIButton,name: UITextField, confirm: UIButton,NBG: UIImageView){
        BRBG = brbg
        PauseBG = bg
        //HelpBtn = help
        LoadBtn = load
        SettingsBtn = set
        ToggleChatText = toggleC
        ToggleWingOptionsText = toggleW
        ToggleChatBtn = toggleCBtn
        ToggleWingOptionsBtn = toggleWBtn
        ExitBtn = exit
        XBtn = x
        pauseMode = true
        BRBG.alpha = 0.5
        NameText = name
        ConfirmButton = confirm
        startMode = true
        NameBG = NBG
    }
    
    func showPause(){
        BRBG.isHidden = false
        PauseBG.isHidden = false
        //HelpBtn.isHidden = false
        LoadBtn.isHidden = false
        SettingsBtn.isHidden = false
        ExitBtn.isHidden = false
        XBtn.isHidden = false
        
        pauseMode = true
    }
    func showSettings(){
        //HelpBtn.isHidden = true
        LoadBtn.isHidden = true
        SettingsBtn.isHidden = true
        ToggleChatText.isHidden = false
        ToggleChatBtn.isHidden = false
        ToggleWingOptionsText.isHidden = false
        ToggleWingOptionsBtn.isHidden = false
        pauseMode = false
        
    }
    func getStartMode()-> Bool{
        return startMode
    }
    func startName(){
        startMode = true
        BRBG.isHidden = false
        NameBG.isHidden = false
        NameText.isHidden = false
        ConfirmButton.isHidden = false
    }
    func getName()-> String{
        return NameText.text ?? ""
    }
    func endName(){
        startMode = false
        BRBG.isHidden = true
        NameBG.isHidden = true
        NameText.isHidden = true
        ConfirmButton.isHidden = true
        NameText.text = ""
    }
    func unpause(){
        BRBG.isHidden = true
        PauseBG.isHidden = true
        ExitBtn.isHidden = true
        XBtn.isHidden = true
        if pauseMode{
            //HelpBtn.isHidden = true
            LoadBtn.isHidden = true
            SettingsBtn.isHidden = true
        }else{
            ToggleChatText.isHidden = true
            ToggleChatBtn.isHidden = true
            ToggleWingOptionsText.isHidden = true
            ToggleWingOptionsBtn.isHidden = true
        }
    }
    
    func changeChatButtonImage(val: Bool){
        changeBtn(btn: ToggleChatBtn, val: val)
    }
    func changeWOptionBtnImage(val: Bool){
        changeBtn(btn: ToggleWingOptionsBtn, val: val)
    }
    
    func changeBtn(btn: UIButton, val:Bool){
        if(val){
            btn.setImage(UIImage(named:"OnMode"), for: .normal)
        }else{
            btn.setImage(UIImage(named:"OffMode"), for: .normal)
        }
    }
    
    func adjustLayers(view: UIView){
        view.bringSubviewToFront(BRBG)
        view.bringSubviewToFront(PauseBG)
        view.bringSubviewToFront(NameBG)
        view.bringSubviewToFront(NameText)
        view.bringSubviewToFront(ConfirmButton)
        
        //view.bringSubviewToFront(HelpBtn)
        view.bringSubviewToFront(LoadBtn)
        view.bringSubviewToFront(SettingsBtn)
        view.bringSubviewToFront(ToggleChatText)
        view.bringSubviewToFront(ToggleChatBtn)
        view.bringSubviewToFront(ToggleWingOptionsText)
        view.bringSubviewToFront(ToggleWingOptionsBtn)
        view.bringSubviewToFront(ExitBtn)
        view.bringSubviewToFront(XBtn)
    }
}
