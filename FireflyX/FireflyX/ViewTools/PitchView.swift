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
    //static var currSong:Song
    static func setPitchImages(staffImage: UIImageView, pitchFlyImage: UIImageView, candy0Image: UIImageView, candy1Image: UIImageView, candy2Image: UIImageView, candy3Image: UIImageView, candy4Image: UIImageView, candy5Image: UIImageView, candy6Image: UIImageView, candy7Image: UIImageView, moveFly:UIImageView, back: UIButton, clear: UIButton, play:UIButton, next:UIButton){
        
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
        
        //pitchFly.translatesAutoresizingMaskIntoConstraints = true
        
    }
    static func setOrigpointsAndAutoFormatConstraints(){
        
        for i in candies{
            origPoints.append(i.center)
            i.translatesAutoresizingMaskIntoConstraints = true
        }
        
    }
    static func setSlots(slotArray: [[PitchSlot]]){
        pitchSLots = slotArray
    }
    static func showCandies(notes:[Note]){
        let hasPitch = notes[0].convertToMIDI() != -1
        for i in 0 ..< notes.count{
            var CImage: UIImage!
            print(notes[i].convertBeat())
            switch notes[i].convertBeat(){
            case "W":
                CImage  = UIImage(named: "cw2")
            case "Wr":
                CImage  = UIImage(named: "cwr2")
            case "H":
                CImage  = UIImage(named: "ch2")
            case "Hr":
                CImage  = UIImage(named: "chr2")
            case "Q":
                CImage  = UIImage(named: "cq2")
            case "Qr":
                CImage  = UIImage(named: "cqr2")
            case "E":
                CImage  = UIImage(named: "ce2")
            case "Er":
                CImage  = UIImage(named: "cer2")
            default:
                CImage  = UIImage(named: "cw2")
                
            }
            candies[i].image = CImage
            candies[i].isHidden = false
            candies[i].isUserInteractionEnabled = true
            
            if (hasPitch){
                let pIndex = notes[i].getPitchIndex()
                print("HAS PITCH")
                takeSlot(notenum: notes[i].getValue(), pitchnum: pIndex)
                snap(candy: candies[i], pitchSlot: pitchSLots[i][pIndex].pitchSlot)
                
            }
        }
        maxPoint = notes.count
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
        //tray.isHidden = val
        pitchFly.isHidden = val
        //candy1.isHidden = val
        //playBtn.isHidden = val
        clearBtn.isHidden = val
        backBtn.isHidden = val
        
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
            if(i==0){
                print(candies[i].center.x)
                print(candies[i].center.y)
            }
            pitchPlaymap[i] = -1
        }
    }
    
    static func checkReady()->Bool{
        for i in 0 ..< maxPoint{
            if pitchPlaymap[i] == -1{
                return false
            }
        }
        return true
    }
    
    static func prepareMoveFly(){
        movingFly.isHidden = false
        movingFly.center = pitchSLots[0][pitchPlaymap[0]].pitchSlot.center
        backBtn.isHidden = true
        clearBtn.isHidden = true
        playBtn.isHidden = true
        nextFBtn.isHidden = true
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
        movingFly.isHidden = true
        
        backBtn.isHidden = false
        clearBtn.isHidden = false
        playBtn.isHidden = false
        nextFBtn.isHidden = false
        //print("SHOW UR SELF")
        pitchFly.isHidden = false
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
}
