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
    var NJarButton: UIButton!
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
    var Paused = false
    init(brbg: UIButton, bg: UIImageView, load:UIButton, set: UIButton, toggleC: UIImageView, toggleW: UIImageView, toggleCBtn:UIButton, toggleWBtn: UIButton, exit: UIButton, x:UIButton,name: UITextField, confirm: UIButton,NBG: UIImageView,NewJarBtn: UIButton){
        BRBG = brbg
        PauseBG = bg
        NJarButton = NewJarBtn
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
        NJarButton.isHidden = false
        LoadBtn.isHidden = false
        SettingsBtn.isHidden = false
        ExitBtn.isHidden = false
        XBtn.isHidden = false
        
        pauseMode = true
        Paused = true
    }
    func showSettings(){
        NJarButton.isHidden = true
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
    func isPaused()-> Bool{
        return Paused
    }
    func startName(){

        startMode = true
        BRBG.isHidden = false
        NameBG.isHidden = false
        NameText.isHidden = false
        ConfirmButton.isHidden = false
        //print(ConfirmButton.isHidden)
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
            NJarButton.isHidden = true
            LoadBtn.isHidden = true
            SettingsBtn.isHidden = true
        }else{
            ToggleChatText.isHidden = true
            ToggleChatBtn.isHidden = true
            ToggleWingOptionsText.isHidden = true
            ToggleWingOptionsBtn.isHidden = true
        }
        Paused = false
    }
    
    func changeChatButtonImage(val: Bool){
        //changeBtn(btn: ToggleChatBtn, val: val)
        if(val){
            ToggleChatBtn.setImage(UIImage(named:"OnMode"), for: .normal)
        }else{
            ToggleChatBtn.setImage(UIImage(named:"OffMode"), for: .normal)
        }
    }
    func changeWOptionBtnImage(val: Bool){
        //changeBtn(btn: ToggleWingOptionsBtn, val: val)
        if(val){
            ToggleWingOptionsBtn.setImage(UIImage(named:"OnModeS"), for: .normal)
        }else{
            ToggleWingOptionsBtn.setImage(UIImage(named:"OffModeS"), for: .normal)
        }
    }

    
    func adjustLayers(view: UIView){
        view.bringSubviewToFront(BRBG)
        view.bringSubviewToFront(PauseBG)
        view.bringSubviewToFront(NameBG)
        view.bringSubviewToFront(NameText)
        view.bringSubviewToFront(ConfirmButton)
        
        view.bringSubviewToFront(NJarButton)
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
