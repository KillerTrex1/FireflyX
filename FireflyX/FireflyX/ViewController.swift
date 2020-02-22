//
//  ViewController.swift
//  FireflyX
//
//  Created by Mart on 14/01/2020.
//  Copyright © 2020 Mart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var FireflyImage: UIImageView!
    
    @IBOutlet weak var BodyWood: UIImageView!
    
    @IBOutlet weak var BodyOptions: UIStackView!
    
    @IBOutlet weak var Wing2Wood: UIImageView!
    
    @IBOutlet weak var Wing2Options: UIStackView!
    
    @IBOutlet weak var Wing1Wood: UIImageView!
    
    @IBOutlet weak var Wing1Options: UIStackView!
    
    
    @IBOutlet weak var RestLever: UIButton!
    
    var bodyTemp = "R"
    var wingTemp = 1
    var tailTemp = 1
    var wing = Wing()
    var body = Body()
    var tail = Tail()
    var jarMode = false
    var restToggle = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }


    @IBAction func RedBody(_ sender: Any) {
        bodyTemp = "R"
        body.setColor(color:Colors.Red)
        UpdateImage()
        
    }
    
    @IBAction func JarFunction(_ sender: Any) {
        jarMode = !jarMode
        //ChoiceAppear()
        tail.setBeatPattern(beatType: wing.firstNote, Bindex: 3)
        let newFly = Firefly(nBody: body, nWing: wing, nTail: tail)
        PlaybackEngine.makeAndPlaySong(mFirefly: newFly)
    }
    @IBAction func ToggleRest(_ sender: Any) {
        restToggle = !restToggle
        if restToggle{
            RestLever.setImage(UIImage(named:"rightLever"), for: .normal)
        }else{
            RestLever.setImage(UIImage(named:"leftLever"), for: .normal)
        }
        
        
    }
    @IBAction func OrangeBody(_ sender: Any) {
        bodyTemp = "O"
        body.setColor(color:Colors.Orange)
        UpdateImage()
        
    }
    
    
    @IBAction func YellowBody(_ sender: Any) {
        bodyTemp = "Y"
        body.setColor(color:Colors.Yellow)
        UpdateImage()
        
    }
    
    
    @IBAction func GreenBody(_ sender: Any) {
        bodyTemp = "G"
        body.setColor(color:Colors.Green)
        UpdateImage()
        
    }
    
    @IBAction func BlueBody(_ sender: Any) {
        bodyTemp = "B"
        body.setColor(color:Colors.Blue)
        UpdateImage()
        
    }
    
    @IBAction func IndigoBody(_ sender: Any) {
        bodyTemp = "I"
        body.setColor(color:Colors.Indigo)
        UpdateImage()
        
    }
    
    @IBAction func VioletBody(_ sender: Any) {
        bodyTemp = "V"
        body.setColor(color:Colors.Violet)
        UpdateImage()
        
    }
    
    @IBAction func WSize1(_ sender: Any) {
        wingTemp = 1
        wing.setRepetitions(repetitions: 1)
        UpdateImage()
        
    }
    
    
    @IBAction func WSize2(_ sender: Any) {
        wingTemp = 2
        wing.setRepetitions(repetitions: 2)
        UpdateImage()
        
    }
    
    @IBAction func WSize3(_ sender: Any) {
        wingTemp = 3
        wing.setRepetitions(repetitions: 3)
        UpdateImage()
        
    }
    
    @IBAction func WSize4(_ sender: Any) {
        wingTemp = 4
        wing.setRepetitions(repetitions: 4)
        UpdateImage()
        
    }
    
    @IBAction func WSize5(_ sender: Any) {
        wingTemp = 5
        wing.setRepetitions(repetitions: 5)
        UpdateImage()
        
    }
    
    @IBAction func WSize6(_ sender: Any) {
        wingTemp = 6
        wing.setRepetitions(repetitions: 6)
        UpdateImage()
        
    }
    
    @IBAction func WNote1(_ sender: Any) {
        if !restToggle {
            wing.firstNote = NoteType.whole
        }else{
            wing.firstNote = NoteType.wholeRest
        }
    }
    
    @IBAction func WNote2(_ sender: Any) {
        if !restToggle {
            wing.firstNote = NoteType.half
        }else{
            wing.firstNote = NoteType.halfRest
        }
    }
    
    @IBAction func WNote4(_ sender: Any) {
        if !restToggle {
            wing.firstNote = NoteType.quarter
        }else{
            wing.firstNote = NoteType.quarterRest
        }
    }
    
    @IBAction func WNote8(_ sender: Any) {
        if !restToggle {
            wing.firstNote = NoteType.eighth
        }else{
            wing.firstNote = NoteType.eighthRest
        }
    }
    
    var imageMode = 0
    func UpdateImage(){
        //FireflyImage.image = UIImage(named: "\(bodyTemp)W\(wingTemp)T\(tailTemp)")
        imageMode+=1
        imageMode = imageMode%3
        if imageMode==0{
            FireflyImage.image = UIImage(named: "red300")
        }else if imageMode==1{
            FireflyImage.image = UIImage(named: "red270")
        }else{
            FireflyImage.image = UIImage(named: "red240")
        }
    }
    
    func ChoiceAppear(){
        BodyWood.isHidden = jarMode
        BodyOptions.isHidden = jarMode
        Wing1Wood.isHidden = jarMode
        Wing1Options.isHidden = jarMode
        Wing2Wood.isHidden = jarMode
        Wing2Options.isHidden = jarMode
        if jarMode {
            
        }
    }
}

