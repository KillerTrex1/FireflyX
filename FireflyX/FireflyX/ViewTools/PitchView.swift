//
//  PitchView.swift
//  FireflyX
//
//  Created by admin on 3/12/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class PitchView{
    static var staff: UIImageView!
    //static var tray: UIImageView!
    static var pitchFly: UIImageView!
    static var candy1:UIImageView!
    static var clear:UIButton!
    static var preview:UIButton!
    static var pitchSLots: [[PitchSlot]]!
    static var candies:[UIImageView]!
    static var origPoints:[CGPoint]!
    static var pitchPlaymap:[Int]!
    static var fIndex:Int!
    static var maxPoint:Int!
    static var movingFly:UIImageView!
    static var clearBtn: UIButton!
    static var backBtn:UIButton!
    static var playBtn:UIButton!
    static var nextFBtn:UIButton!
    static var settingsBtn: UIButton!
    static var saveBtn: UIButton!
    static var settings: UIButton!
    static var previewMode: Bool!
    static var fullMode:Bool!
    static func setPitchImages(staffImage: UIImageView, pitchFlyImage: UIImageView, candy0Image: UIImageView, candy1Image: UIImageView, candy2Image: UIImageView, candy3Image: UIImageView, candy4Image: UIImageView, candy5Image: UIImageView, candy6Image: UIImageView, candy7Image: UIImageView, moveFly:UIImageView, back: UIButton, clear: UIButton, play:UIButton, next:UIButton, settings: UIButton, save: UIButton){
        
        staff = staffImage
        //tray = trayImage
        pitchFly = pitchFlyImage
        //candy1 = candyImage
        candies = [UIImageView]()
        candies.append(candy0Image)
        candies.append(candy1Image)
        candies.append(candy2Image)
        candies.append(candy3Image)
        candies.append(candy4Image)
        candies.append(candy5Image)
        candies.append(candy6Image)
        candies.append(candy7Image)
        origPoints = [CGPoint]()
        pitchPlaymap = [-1,-1,-1,-1,-1,-1,-1,-1]
        fIndex = -1
        movingFly = moveFly
        backBtn = back
        playBtn = play
        clearBtn = clear
        nextFBtn = next
        settingsBtn = settings
        saveBtn = save
        
        pitchFly.isHidden = true
        fullMode = false
        previewMode = true
        //pitchFly.translatesAutoresizingMaskIntoConstraints = true
        
    }
    static func setOrigpointsAndAutoFormatConstraints(){
        
        for i in candies{
            origPoints.append(i.center)
            i.translatesAutoresizingMaskIntoConstraints = true
        }
        
    }
    static func getPitchFly()->UIImageView{
        return pitchFly
    }
    static func getMovingFly()->UIImageView{
        return movingFly
    }
    static func setSlots(slotArray: [[PitchSlot]]){
        pitchSLots = slotArray
    }
    static func showCandies(notes:[Note]){
        clearAll()
        let hasPitch = notes[0].convertToMIDI() != -1
        for i in 0 ..< notes.count{
            var CImage: UIImage!
            print(notes[i].convertBeat())
            switch notes[i].convertBeat(){
            case "W":
                CImage  = UIImage(named: "tcw2")
            case "Wr":
                CImage  = UIImage(named: "tcwr2")
            case "H":
                CImage  = UIImage(named: "tch2")
            case "Hr":
                CImage  = UIImage(named: "tchr2")
            case "Q":
                CImage  = UIImage(named: "tcq2")
            case "Qr":
                CImage  = UIImage(named: "tcqr2")
            case "E":
                CImage  = UIImage(named: "tce2")
            case "Er":
                CImage  = UIImage(named: "tcer2")
            default:
                CImage  = UIImage(named: "tcw2")
                
            }
            candies[i].image = CImage
            candies[i].isHidden = false
            candies[i].isUserInteractionEnabled = true
            
            if (hasPitch){
                let pIndex = notes[i].getPitchIndex()
                //print("HAS PITCH")
                takeSlot(notenum: i, pitchnum: pIndex)
                snap(candy: candies[i], pitchSlot: pitchSLots[i][pIndex].pitchSlot)
                print("candy")
                print(candies[i].center.x)
                print(candies[i].center.y)
                print(i)
                if notes[i].isRest(){
                    candies[i].isUserInteractionEnabled = false
                    candies[i].alpha = 0.8
                    
                }else{
                    candies[i].isUserInteractionEnabled = true
                    candies[i].alpha = 1.0
                }
            }
        }
        maxPoint = notes.count
        fIndex = -1
        checkReady()
    }
    static func disableCandies(){
        for i in 0 ..< candies.count{
            candies[i].isUserInteractionEnabled = false
        }
    }
    static func hideCandies(){
        for i in 0 ..< candies.count{
            candies[i].isHidden = true
            candies[i].isUserInteractionEnabled = false
        }
    }
    static func retainCandies(){
        //print("RETAINNNNNNNNNNNNNNNNNNNN")
        for i in 0 ..< maxPoint{
            candies[i].center = pitchSLots[i][pitchPlaymap[i]].pitchSlot.center
        }
        
    }
    static func shouldHide(val: Bool){
        staff.isHidden = val
        saveBtn.isHidden = val
        //settingsBtn.isHidden = val
        //tray.isHidden = val
        pitchFly.isHidden = val

        clearBtn.isHidden = val
        backBtn.isHidden = val
        
        if val{
            hideCandies()
            pitchFly.isHidden = val

            hidePlayNext(val: val)
        }
    }
    
    static func revealSlots(val: Int){
        for i in 0 ..< pitchSLots[0].count{
            pitchSLots[val][i].showSlot()
        }
    }
    static func hideSlots(val: Int){
        for i in 0 ..< pitchSLots[0].count{
            pitchSLots[val][i].hideslot()
        }
    }
    
    
    static func takeSlot(notenum: Int, pitchnum:Int){
        for i in 0 ..< pitchSLots[0].count{
            pitchSLots[notenum][i].freeSlot()
        }
        
        pitchSLots[notenum][pitchnum].takeSlot()
        pitchPlaymap[notenum]=pitchnum

    }
    
    static func clearAll(){
        //print("CLEAR--------------------------")
        
        for i in 0 ..< pitchSLots.count{
            for j in 0 ..< pitchSLots[i].count {
                pitchSLots[i][j].freeSlot()
            }
        }
        for i in 0 ..< candies.count{
            candies[i].center = origPoints[i]
            pitchPlaymap[i] = -1
        }
        //hidePlayNext(val: true)
    }
    
    static func checkReady(){
        var val = true
        for i in 0 ..< maxPoint{
            if pitchPlaymap[i] == -1{
                val = false
                break
            }
        }
        if val{
            
            hidePlayNext(val: false)
        }
    }
 
    
    static func prepareMoveFly(forPreview: Bool){
        //print(pitchPlaymap[0])
        //print(pitchSLots[0].count)
        previewMode = forPreview
        hidePitchButtonsForMoving(val: true)
        movingFly.center = pitchSLots[0][pitchPlaymap[0]].pitchSlot.center
    }
    static func nextNoteMove(){
        fIndex += 1
        if fIndex == maxPoint{
            fIndex = 0
        }
        movingFly.center = pitchSLots[fIndex][pitchPlaymap[fIndex]].pitchSlot.center
    }
    static func endMoveFly(){
        fIndex = -1
        hidePitchButtonsForMoving(val: false)
    }
    static func hidePitchButtonsForMoving(val:Bool){
        movingFly.isHidden = !val
        settingsBtn.isHidden = val
        backBtn.isHidden = val
        clearBtn.isHidden = val
        saveBtn.isHidden = val
        pitchFly.isHidden = val
        hidePlayNext(val: val)
        print(previewMode)
        if previewMode{
            View.hideJarStuffForPreview(val: val)
        }
        //View.hideJarStuffForPreview(val: val)
    }
    
    
    
    static func trySnap(val: Int)->Int{
        for i in 0 ..< pitchSLots[0].count{
            //print(pitchSLots[0].count)
            if candies[val].frame.intersects(pitchSLots[val][i].pitchSlot.frame){
                //print("yoink")
                //print(i)
                if i != (pitchSLots[val].count - 1){
                    if candies[val].frame.intersects(pitchSLots[val][i+1].pitchSlot.frame){
                        let upper = abs(Float(pitchSLots[val][i].pitchSlot.center.y - candies[val].center.y))
                        let lower = abs(Float(pitchSLots[val][i+1].pitchSlot.center.y - candies[val].center.y))
                        if lower < upper {
                            //candies[val].center = pitchSLots[val][i+1].pitchSlot.center
                            snap(candy: candies[val], pitchSlot: pitchSLots[val][i+1].pitchSlot)
                            return i+1
                        }else{
                            
                            //candies[val].center = pitchSLots[val][i].pitchSlot.center
                            snap(candy: candies[val], pitchSlot: pitchSLots[val][i].pitchSlot)
                        }
                    }else{
                        //candies[val].center = pitchSLots[val][i].pitchSlot.center
                        snap(candy: candies[val], pitchSlot: pitchSLots[val][i].pitchSlot)
                    }
                }else{
                    //candies[val].center = pitchSLots[val][i].pitchSlot.center
                    snap(candy: candies[val], pitchSlot: pitchSLots[val][i].pitchSlot)
                }
                //print(i)
                return i
            }
        }
        return -1
    
    }
    
    static func snap(candy: UIImageView,pitchSlot:UIImageView){
        candy.center = pitchSlot.center
    }
    static func hidePlayNext(val: Bool){
        playBtn.isHidden = val
        if !fullMode{
            nextFBtn.isHidden = val
        }
    }
    static func setFull(val: Bool){
        fullMode = val
        if fullMode{
            nextFBtn.isHidden = true
        }
    }
}
