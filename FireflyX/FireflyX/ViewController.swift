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

    @IBOutlet weak var FireFlySupport: UIImageView!
    
    @IBOutlet weak var BodyWood: UIImageView!
    
    @IBOutlet weak var BodyOptions: UIStackView!
    
    @IBOutlet weak var Wing2Wood: UIImageView!
    
    @IBOutlet weak var Wing2Options: UIStackView!
    
    @IBOutlet weak var Wing1Wood: UIImageView!
    
    @IBOutlet weak var Wing1Options: UIStackView!
    
    @IBOutlet weak var RestLever: UIButton!
    
    @IBOutlet weak var TailWood: UIImageView!
    
    @IBOutlet weak var TailOptions: UIStackView!
    
    @IBOutlet weak var Tail0: UIButton!
    
    @IBOutlet weak var Tail1: UIButton!
    
    @IBOutlet weak var Tail2: UIButton!
    
    @IBOutlet weak var Tail3: UIButton!
    
    @IBOutlet weak var Tail4: UIButton!
    
    @IBOutlet weak var Play: UIButton!
    
    @IBOutlet weak var DotTop: UIImageView!
    
    @IBOutlet weak var DotLeft: UIImageView!
    
    @IBOutlet weak var DotRIght: UIImageView!
    
    @IBOutlet weak var DotBottom: UIImageView!
    
    @IBOutlet weak var HeadTouchArea: UIButton!
    
    @IBOutlet weak var LeftWingTouchArea: UIButton!
    
    @IBOutlet weak var RightWingTouchArea: UIButton!
    
    @IBOutlet weak var TailTouchArea: UIButton!
    
    @IBOutlet weak var TopTouchAreaLength: NSLayoutConstraint!
    
    @IBOutlet weak var TopTouchAreaWidth: NSLayoutConstraint!
    
    @IBOutlet weak var LeftWingTouchAreaHeight: NSLayoutConstraint!
    
    @IBOutlet weak var TailTouchAreaWidth: NSLayoutConstraint!
    
    var bodyTemp = "Y"
    var wingTemp = 1
    var tailTemp = 1
    var wing = Wing()
    var body = Body()
    var tail = Tail()
    var jarMode = false
    var restToggle = false
    var previousWhole = false
    var winglock = true
    var tail1lock = true
    var tail2lock = true
    var playlock = true
    var dimensions: [CGFloat] = [150.0,180.0,210.0,240.0,270.0,300.0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lockProgress()
        ChangeTopTouchSize()
        View.setMainImages(firefly: FireflyImage, body: BodyWood, wing1: Wing1Wood, wing2: Wing2Wood, tail: TailWood)
        View.setDots(dotTop: DotTop, dotWing1: DotRIght, dotWing2: DotLeft, dotTail: DotBottom)
        View.setOptionStacks(bOptions: BodyOptions, w1Options: Wing1Options, w2Options: Wing2Options, tOptions: TailOptions)
        View.setButtons(playButton: Play, headArea: HeadTouchArea, wing1Area: RightWingTouchArea, wing2Area: LeftWingTouchArea,rLever: RestLever, tailArea: TailTouchArea)
        FireflyAnimator.setImage(flyImageView: FireflyImage,support: FireFlySupport)
        //FireflyAnimator.setIarray(ImageCount: 8, ImagePrefix: "YW1C")
        
        //FireflyAnimator.animateImage(duration:1.0)
        //FireflyAnimator.animateImage(Image: FireflyImage, Animations: flaps)
    }
    
    func lockProgress(){
        winglock = true
        tail1lock = true
        tail2lock = true
        playlock = true
        
        toggleBody()
        
        toggleWing1()
        toggleRightWingTouch()
        
        toggleLeftWingtouch()
        toggleWing2()
        
        toggleTailTouch()
        toggleTail()
        
        Play.isHidden = !Play.isHidden
    }
    
    func toggleBodyTouch(){
        DotTop.isHidden = !DotTop.isHidden
        HeadTouchArea.isHidden = !HeadTouchArea.isHidden
    }
    func toggleRightWingTouch(){
        DotRIght.isHidden = !DotRIght.isHidden
        RightWingTouchArea.isHidden = !RightWingTouchArea.isHidden
        
    }
    func toggleLeftWingtouch(){
        DotLeft.isHidden = !DotLeft.isHidden
        LeftWingTouchArea.isHidden = !LeftWingTouchArea.isHidden
    }
    func toggleTailTouch(){
        DotBottom.isHidden = !DotBottom.isHidden
        TailTouchArea.isHidden = !TailTouchArea.isHidden
    }


    
    @IBAction func JarFunction(_ sender: Any) {
        jarMode = !jarMode
        //ChoiceAppear()
        let newFly = Firefly(nBody: body, nWing: wing, nTail: tail)
        PlaybackEngine.makeAndPlaySong(mFirefly: newFly)
        View.hidePanels(val: true)
        //FireflyAnimator.animateImageOnce(duration: 4.0)
    }
    
    
    @IBAction func ToggleRest(_ sender: Any) {
        restToggle = !restToggle
        if restToggle{
            RestLever.setImage(UIImage(named:"rightLever"), for: .normal)
        }else{
            RestLever.setImage(UIImage(named:"leftLever"), for: .normal)
        }
        UpdateImage()
        
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
        if(winglock){
            winglock = false
            toggleLeftWingtouch()
            toggleRightWingTouch()
        }
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
        ChangeTopTouchSize()
        if(tail1lock){
            tail1lock = false
            checkTailLock()
        }
        
    }
    func checkTailLock(){
        if !tail1lock && !tail2lock {
            toggleTailTouch()
        }
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
        tailLock2Unlock()
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
        tailLock2Unlock()
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
        tailLock2Unlock()
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
        tailLock2Unlock()
    }
    func tailLock2Unlock(){
        if(tail2lock){
            tail2lock = false
            checkTailLock()
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
    
    
    @IBAction func HeadTouch(_ sender: Any) {
        toggleBody()
        DotTop.isHidden = true
    }
    
    @IBAction func LWingTouch(_ sender: Any) {
        toggleWing2()
        DotLeft.isHidden = true
    }
    
    @IBAction func RWingTouch(_ sender: Any) {
        toggleWing1()
        DotRIght.isHidden = true
    }
    
    @IBAction func TailTouch(_ sender: Any) {
        toggleTail()
        DotBottom.isHidden = true
    }

    
    func toggleBody(){
        BodyWood.isHidden = !BodyWood.isHidden
        BodyOptions.isHidden = !BodyOptions.isHidden
        
    }
    func toggleWing1(){
        Wing1Wood.isHidden = !Wing1Wood.isHidden
        Wing1Options.isHidden = !Wing1Options.isHidden
        
    }
    func toggleWing2(){
        Wing2Wood.isHidden = !Wing2Wood.isHidden
        Wing2Options.isHidden = !Wing2Options.isHidden
        RestLever.isHidden = !RestLever.isHidden
        
    }
    func toggleTail(){
        TailWood.isHidden = !TailWood.isHidden
        TailOptions.isHidden = !TailOptions.isHidden
        
    }
    
    func changeTail(index:Int){
        tail.setBeatPattern(beatType: wing.getNFirstNote(), Bindex: index)
        if(playlock){
            playlock = false
            Play.isHidden = false
        }
    }
    
    //var imageMode = 0
    func UpdateImage(){
        //FireflyAnimator.ResetAnimate()
        if  restToggle{
            FireflyImage.image = UIImage(named: "\(bodyTemp)W\(wingTemp)T\(tailTemp)R")
            FireFlySupport.image = UIImage(named: "\(bodyTemp)W\(wingTemp)T\(tailTemp)R")
        }else{
            FireFlySupport.image = UIImage(named: "\(bodyTemp)W\(wingTemp)T\(tailTemp)")
            FireflyImage.image = UIImage(named: "\(bodyTemp)W\(wingTemp)T\(tailTemp)")
        }
        let prefix = "\(bodyTemp)W\(wingTemp)C"
        FireflyAnimator.setIarray(ImageCount: 8, ImagePrefix: prefix)
        
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
    
    func ChangeTopTouchSize(){
        let newBHeight = dimensions[wingTemp-1] * 0.28 * -1
        //print("HEIGHT: \(FireflyImage.frame.size.height)")
        TopTouchAreaLength.constant = newBHeight
        let newBWidth = dimensions[wingTemp-1] * 0.15
        //print("WIDTH: \(FireflyImage.frame.size.width)")
        TopTouchAreaWidth.constant = newBWidth
        let newLWHeight = dimensions[wingTemp-1] * 0.20 * -1
        LeftWingTouchAreaHeight.constant = newLWHeight
        
        let newTWidth = dimensions[wingTemp-1] * 0.15 * -1
        TailTouchAreaWidth.constant = newTWidth
        
        
    }
    
    
    
    
    
}

