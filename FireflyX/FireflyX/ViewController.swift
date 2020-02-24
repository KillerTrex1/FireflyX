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
    
    
    @IBOutlet weak var Tail0: UIButton!
    
    @IBOutlet weak var Tail1: UIButton!
    
    @IBOutlet weak var Tail2: UIButton!
    
    @IBOutlet weak var Tail3: UIButton!
    
    @IBOutlet weak var Tail4: UIButton!
    
    
    
    var bodyTemp = "Y"
    var wingTemp = 1
    var tailTemp = 1
    var wing = Wing()
    var body = Body()
    var tail = Tail()
    var jarMode = false
    var restToggle = false
    var previousWhole = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }



    
    @IBAction func JarFunction(_ sender: Any) {
        jarMode = !jarMode
        //ChoiceAppear()
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
    @IBAction func RedBody(_ sender: Any) {
        bodyChange(Bcolor: "R")
    }
    
    
    @IBAction func OrangeBody(_ sender: Any) {
        bodyChange(Bcolor: "O")
    }
    
    
    @IBAction func YellowBody(_ sender: Any) {
        bodyChange(Bcolor: "Y")
    }
    
    
    @IBAction func GreenBody(_ sender: Any) {
        bodyChange(Bcolor: "G")
        
    }
    
    @IBAction func BlueBody(_ sender: Any) {
        bodyChange(Bcolor: "B")
        
    }
    
    @IBAction func IndigoBody(_ sender: Any) {
        bodyChange(Bcolor: "I")
        
    }
    
    @IBAction func VioletBody(_ sender: Any) {
        bodyChange(Bcolor: "V")
        
    }
    
    func bodyChange(Bcolor:String){
        bodyTemp = Bcolor
        body.setColor(color: Lookups.colorsLookup(color: Bcolor))
        UpdateImage()
        UpdateTailOptions(isSingle: previousWhole)
    }
    
    @IBAction func WSize1(_ sender: Any) {
        changeWingSize(num: 1)
        
    }
    
    
    @IBAction func WSize2(_ sender: Any) {
        changeWingSize(num: 2)
    }
    
    @IBAction func WSize3(_ sender: Any) {
        changeWingSize(num: 3)
        
    }
    
    @IBAction func WSize4(_ sender: Any) {
        changeWingSize(num: 4)
        
    }
    
    @IBAction func WSize5(_ sender: Any) {
        changeWingSize(num: 5)
        
    }
    
    @IBAction func WSize6(_ sender: Any) {
        changeWingSize(num: 6)
    }
    func changeWingSize(num:Int){
        wingTemp = num
        wing.setRepetitions(repetitions: num)
        UpdateImage()
    }
    
    @IBAction func WNote1(_ sender: Any) {
        if !previousWhole{
            ChangeTailOptionsCount(isWhole: true)
            previousWhole = true
        }
        if !restToggle {
            wing.firstNote = NoteType.whole
        }else{
            wing.firstNote = NoteType.wholeRest
        }
        changeTail(index: 2)
    }
    
    @IBAction func WNote2(_ sender: Any) {
        if previousWhole{
            ChangeTailOptionsCount(isWhole: false)
            previousWhole = false
        }
        if !restToggle {
            wing.firstNote = NoteType.half
        }else{
            wing.firstNote = NoteType.halfRest
        }
    }
    
    @IBAction func WNote4(_ sender: Any) {
        if previousWhole{
            ChangeTailOptionsCount(isWhole: false)
            previousWhole = false
        }
        if !restToggle {
            wing.firstNote = NoteType.quarter
        }else{
            wing.firstNote = NoteType.quarterRest
        }
    }
    
    @IBAction func WNote8(_ sender: Any) {
        if previousWhole{
            ChangeTailOptionsCount(isWhole: false)
            previousWhole = false
        }
        if !restToggle {
            wing.firstNote = NoteType.eighth
        }else{
            wing.firstNote = NoteType.eighthRest
        }
    }
    
    @IBAction func TailButton0(_ sender: Any) {
        changeTail(index: 0)
    }
    
    @IBAction func TailButton1(_ sender: Any) {
        changeTail(index: 1)
    }
    
    @IBAction func TailButton2(_ sender: Any) {
        changeTail(index: 2)
    }
    @IBAction func TailButton3(_ sender: Any) {
        changeTail(index: 3)
    }
    
    @IBAction func TailButton4(_ sender: Any) {
        changeTail(index: 4)
    }
    
    func changeTail(index:Int){
        tail.setBeatPattern(beatType: wing.getNFirstNote(), Bindex: index)
    }
    
    //var imageMode = 0
    func UpdateImage(){
        FireflyImage.image = UIImage(named: "\(bodyTemp)W\(wingTemp)T\(tailTemp)")
        /*
        imageMode+=1
        imageMode = imageMode%3
        if imageMode==0{
            FireflyImage.image = UIImage(named: "red300")
        }else if imageMode==1{
            FireflyImage.image = UIImage(named: "red270")
        }else{
            FireflyImage.image = UIImage(named: "red240")
        }
 */
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
    

    func ChangeTailOptionsCount(isWhole:Bool){
        Tail0.isHidden = isWhole
        Tail1.isHidden = isWhole
        Tail3.isHidden = isWhole
        Tail4.isHidden = isWhole
        UpdateTailOptions(isSingle:isWhole)
    }
    
    
    func UpdateTailOptions(isSingle:Bool){
        if isSingle{
            Tail2.setImage(UIImage(named:"\(bodyTemp)LBig"), for: .normal)
        }else{
            Tail0.setImage(UIImage(named:"\(bodyTemp)L0"), for: .normal)
            Tail1.setImage(UIImage(named:"\(bodyTemp)L1"), for: .normal)
            Tail2.setImage(UIImage(named:"\(bodyTemp)L2"), for: .normal)
            Tail3.setImage(UIImage(named:"\(bodyTemp)L3"), for: .normal)
            Tail4.setImage(UIImage(named:"\(bodyTemp)L4"), for: .normal)
            
        }
        
    }
    
    
}

