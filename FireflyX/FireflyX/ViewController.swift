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
    
    @IBOutlet weak var Arrow: UIImageView!
    
    @IBOutlet weak var Arrow2: UIImageView!
    
    
    @IBOutlet weak var Staff: UIImageView!
    
    @IBOutlet weak var FeedBtn: UIButton!
    
    @IBOutlet weak var Candy0: UIImageView!
    
    @IBOutlet weak var Candy1: UIImageView!
    
    @IBOutlet weak var Candy2: UIImageView!
    
    @IBOutlet weak var Candy3: UIImageView!
    
    @IBOutlet weak var Candy4: UIImageView!
    
    @IBOutlet weak var Candy5: UIImageView!
    
    @IBOutlet weak var Candy6: UIImageView!
    
    @IBOutlet weak var Candy7: UIImageView!
    
    @IBOutlet weak var StartingJar: UIButton!
    
    @IBOutlet weak var EndingJar: UIImageView!
    
    @IBOutlet weak var PitchFly: UIImageView!
    
    @IBOutlet weak var MovingPitchFly: UIImageView!
    
    @IBOutlet weak var ClearButton: UIButton!
    
    @IBOutlet weak var BackButton: UIButton!
    
    
    @IBOutlet var PGRecognizer0: UIPanGestureRecognizer!
    
    @IBOutlet var PGRecognizer1: UIPanGestureRecognizer!
    
    @IBOutlet var PGRecognizer2: UIPanGestureRecognizer!
    
    @IBOutlet var PGRecognizer3: UIPanGestureRecognizer!
    
    @IBOutlet var PGRecognizer4: UIPanGestureRecognizer!
    
    @IBOutlet var PGRecognizer5: UIPanGestureRecognizer!
    
    @IBOutlet var PGRecognizer6: UIPanGestureRecognizer!
    
    @IBOutlet var PGRecognizer7: UIPanGestureRecognizer!
    
    
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
    var arrowApppear = false
    var arrow2Appear = false
    var dimensions: [CGFloat] = [150.0,180.0,210.0,240.0,270.0,300.0]
    var prevPoint: CGPoint!
    var fSong: Song!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lockProgress()
        ChangeTopTouchSize()
        View.setMainImages(firefly: FireflyImage, body: BodyWood, wing1: Wing1Wood, wing2: Wing2Wood, tail: TailWood)
        View.setDots(dotTop: DotTop, dotWing1: DotRIght, dotWing2: DotLeft, dotTail: DotBottom)
        View.setOptionStacks(bOptions: BodyOptions, w1Options: Wing1Options, w2Options: Wing2Options, tOptions: TailOptions)
        View.setButtons(playButton: Play, headArea: HeadTouchArea, wing1Area: RightWingTouchArea, wing2Area: LeftWingTouchArea,rLever: RestLever, tailArea: TailTouchArea)
        View.setArrow(wingArrow: Arrow2, tailArrow: Arrow)
        FireflyAnimator.setImage(flyImageView: FireflyImage,support: FireFlySupport)
        PitchView.setPitchImages(staffImage: Staff, pitchFlyImage: PitchFly, candy0Image: Candy0, candy1Image: Candy1, candy2Image: Candy2, candy3Image: Candy3, candy4Image: Candy4, candy5Image: Candy5, candy6Image: Candy6, candy7Image: Candy7, moveFly: MovingPitchFly, back: BackButton, clear: ClearButton, play: Play)
        
        
        //FireflyAnimator.setIarray(ImageCount: 8, ImagePrefix: "YW1C")
        //PitchView.showCandies(num: 4)
        //FireflyAnimator.animateImage(duration:1.0)
        //FireflyAnimator.animateImage(Image: FireflyImage, Animations: flaps)
    }
    
    
    func addSlots(){
        
        var pSlots = [[PitchSlot]]()
        for i in 0 ... 7{
            var array = [PitchSlot]()
            var slotImage  = UIImage(named: "Slot")
            for j in 0 ... 12{
                var imageView : UIImageView
                let staffRatio = Double(Staff.frame.height) * 0.12
                let xM: Double = Double((110 * i) + 50)
                let yM: Double = Double((staffRatio * Double(j)) - (staffRatio * 1.9))
                let height = Candy0.frame.height/3
                let width = Candy0.frame.width/3
                
                
                imageView  = UIImageView(frame: CGRect(x: CGFloat(xM) + Staff.frame.origin.x, y: CGFloat(yM) + Staff.frame.origin.y , width : width, height: height))
                imageView.image = slotImage
                var newSlot: PitchSlot
                if j == 0 || j == 12{
                    var edgeImage  = UIImage(named: "Edgeline")
                    
                    var edgeLineView = UIImageView(frame: CGRect(x:  0, y: 0, width : width * 1.5, height: height))
                    edgeLineView.image = edgeImage
                    newSlot = PitchSlot(pitchslot: imageView, edgeLine: edgeLineView)
                    edgeLineView.isHidden = true
                    self.view.addSubview(edgeLineView)
                }else{
                    newSlot = PitchSlot(pitchslot: imageView)
                }
                array.append(newSlot)
                imageView.isHidden = true
                self.view.addSubview(imageView)
            }
            pSlots.append(array)
        }
        PitchView.setSlots(slotArray: pSlots)
        
    }
    
    @IBAction func openJar(_ sender: Any) {
        StartingJar.isHidden = true
        EndingJar.isHidden = false
        PitchView.setOrigpoints()
        addSlots()
    }
    
    
    @IBAction func ShowPitch(_ sender: Any) {
        PitchView.shouldHide(val: false)
        View.hideAll(val: true)
        FeedBtn.isHidden = true
        let newFly = Firefly(nBody: body, nWing: wing, nTail: tail)
        fSong = PlaybackEngine.makeSongnoPitch(mFirefly: newFly)
        PitchView.showCandies(notes: fSong.getNotes())
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
        changeWingSizeAndUnlockTail1(num: 1)
    }
    
    
    @IBAction func WSize2(_ sender: Any) {
        changeWingSizeAndUnlockTail1(num: 2)
    }
    
    @IBAction func WSize3(_ sender: Any) {
        changeWingSizeAndUnlockTail1(num: 3)
        
    }
    
    @IBAction func WSize4(_ sender: Any) {
        changeWingSizeAndUnlockTail1(num: 4)
        
    }
    
    @IBAction func WSize5(_ sender: Any) {
        changeWingSizeAndUnlockTail1(num: 5)
        
    }
    
    @IBAction func WSize6(_ sender: Any) {
        changeWingSizeAndUnlockTail1(num: 6)
    }
    func tail1LockUnlock(){
        
        if(tail1lock){
            tail1lock = false
            arrow2Appear = true
            checkTailLock()
        }
    }
    
    func changeWingSizeAndUnlockTail1(num:Int){
        changeWingSize(num: num)
        tail1LockUnlock()
    }
    func changeWingSize(num:Int){
        wingTemp = num
        wing.setRepetitions(repetitions: num)
        UpdateImage()
        ChangeTopTouchSize()

        
    }
    func checkTailLock(){
        if !tail1lock && !tail2lock {
            toggleTailTouch()
        }
    }
    
    @IBAction func WNote1(_ sender: Any) {
        
        if !restToggle {
            wing.firstNote = NoteType.whole
        }else{
            wing.firstNote = NoteType.wholeRest
        }
        changeTail(index: 2)
        MoveArrow(mArrow: Arrow, stack: TailOptions, Sindex: 2)
        changeFirstNote(fNoteIndex: 1)
    }
    
    @IBAction func WNote2(_ sender: Any) {
        if !restToggle {
            wing.firstNote = NoteType.half
        }else{
            wing.firstNote = NoteType.halfRest
        }
        changeFirstNote(fNoteIndex: 2)
        
    }
    
    @IBAction func WNote4(_ sender: Any) {

        if !restToggle {
            wing.firstNote = NoteType.quarter
        }else{
            wing.firstNote = NoteType.quarterRest
        }
        changeFirstNote(fNoteIndex: 3)
    }
    
    @IBAction func WNote8(_ sender: Any) {
        
        if !restToggle {
            wing.firstNote = NoteType.eighth
        }else{
            wing.firstNote = NoteType.eighthRest
        }
        changeFirstNote(fNoteIndex: 4)
    }
    func changeFirstNote(fNoteIndex: Int){
        if fNoteIndex == 1{
            if !previousWhole{
                ChangeTailOptionsCount(isWhole: true)
                previousWhole = true
            }
        }else{
            if previousWhole{
                ChangeTailOptionsCount(isWhole: false)
                previousWhole = false
            }
        }
        tailLock2Unlock()
        MoveArrow(mArrow: Arrow2, stack: Wing2Options, Sindex: fNoteIndex - 1)
        arrow2Appear = true
    }
    func tailLock2Unlock(){
        if(tail2lock){
            tail2lock = false
            checkTailLock()
        }
    }
    
    @IBAction func TailButton0(_ sender: Any) {
        changeTail(index: 0)
        //MoveArrow(button: Tail0)
    }
    
    @IBAction func TailButton1(_ sender: Any) {
        changeTail(index: 1)
        //MoveArrow(button: Tail1)
    }
    
    @IBAction func TailButton2(_ sender: Any) {
        changeTail(index: 2)
        //MoveArrow(button: Tail2)
    }
    @IBAction func TailButton3(_ sender: Any) {
        changeTail(index: 3)
        //MoveArrow(button: Tail3)
    }
    
    @IBAction func TailButton4(_ sender: Any) {
        changeTail(index: 4)
        //MoveArrow(button: Tail4)
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
        if arrow2Appear{
            Arrow2.isHidden = !Arrow2.isHidden
        }
        
    }
    func toggleTail(){
        TailWood.isHidden = !TailWood.isHidden
        TailOptions.isHidden = !TailOptions.isHidden
        if arrowApppear{
            Arrow.isHidden = !Arrow.isHidden
        }
    }
    
    func changeTail(index:Int){
        tail.setBeatPattern(beatType: wing.getNFirstNote(), Bindex: index)
        if(playlock){
            playlock = false
            FeedBtn.isHidden = false
            //Play.isHidden = false
        }
        MoveArrow(mArrow: Arrow, stack: TailOptions, Sindex: index)
        arrowApppear =  true
    }
    
    //var imageMode = 0
    func UpdateImage(){
        //FireflyAnimator.ResetAnimate()
        if  restToggle{
            FireflyImage.image = UIImage(named: "\(bodyTemp)W\(wingTemp)T\(tailTemp)R")
            FireflyAnimator.setAnimationMode(isRest: true)
            
            
            PitchFly.image = UIImage(named: "\(bodyTemp)W\(wingTemp)T\(tailTemp)R")
            MovingPitchFly.image = UIImage(named: "\(bodyTemp)W1T\(tailTemp)R")
            
            //FireFlySupport.image = UIImage(named: "\(bodyTemp)W\(wingTemp)T\(tailTemp)R")
        }else{
            FireflyImage.image = UIImage(named: "\(bodyTemp)W\(wingTemp)T\(tailTemp)")
            FireflyAnimator.setAnimationMode(isRest: false)
            let pic: UIImage!
            pic = UIImage(named: "\(bodyTemp)W\(wingTemp)T\(tailTemp)")
            FireflyAnimator.setRestImage(image: pic)
            
            //FireflyImage.image = UIImage(named: "\(bodyTemp)W\(wingTemp)T\(tailTemp)")
            PitchFly.image = UIImage(named: "\(bodyTemp)W\(wingTemp)T\(tailTemp)")
            MovingPitchFly.image = UIImage(named: "\(bodyTemp)W1T\(tailTemp)")
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
        
        checkArrowAppearance()
    }
    
    func checkArrowAppearance(){
        if !arrowApppear{
            Arrow.isHidden = true
        }
        if !arrow2Appear{
            Arrow.isHidden = true
        }
    }
    
    func MoveArrow (mArrow: UIImageView!,stack: UIStackView!, Sindex: Int){
        let stackWidth: CGFloat!
        let ArrowWidth:CGFloat!
        
        stackWidth = stack.frame.size.width
        let elementWidth = stackWidth / CGFloat(stack.arrangedSubviews.count )
        let curElementLocation = elementWidth * CGFloat (Sindex) + (CGFloat((Sindex - 2) * 4) )
        
        ArrowWidth = mArrow.frame.size.width
        let xLocation = stack.frame.origin.x + curElementLocation + ( elementWidth / 2.0) - (ArrowWidth / 2.0)
        let ArrowHeight: CGFloat!
        ArrowHeight = mArrow.frame.size.height
        let yLocation = stack.frame.origin.y - ArrowHeight - 3
        mArrow.isHidden = false
        
        mArrow.frame.origin = CGPoint(x: xLocation , y: yLocation)
    }
    
    @IBAction func CandyAction0(_ gesture: UIPanGestureRecognizer) {
        gestureActions(gesture: gesture, index: 0)
    }
    
    
    @IBAction func CandyAction1(_ gesture: UIPanGestureRecognizer) {
        gestureActions(gesture: gesture, index: 1)
    }
    
    @IBAction func CandyAction2(_ gesture: UIPanGestureRecognizer) {
        gestureActions(gesture: gesture, index: 2)
    }
    
    @IBAction func CandyAction3(_ gesture: UIPanGestureRecognizer) {
        gestureActions(gesture: gesture, index: 3)
    }
    
    @IBAction func CandyAction4(_ gesture: UIPanGestureRecognizer) {
        gestureActions(gesture: gesture, index: 4)
    }
    
    @IBAction func CandyAction5(_ gesture: UIPanGestureRecognizer) {
        gestureActions(gesture: gesture, index: 5)
    }
    
    @IBAction func CandyAction6 (_ gesture: UIPanGestureRecognizer) {
        gestureActions(gesture: gesture, index: 6)
    }
    
    @IBAction func CandyAction7 (_ gesture: UIPanGestureRecognizer) {
        gestureActions(gesture: gesture, index: 7)
    }
    
    func gestureActions(gesture: UIPanGestureRecognizer, index: Int){
        guard let gestureView = gesture.view else {
            return
          }

          if gesture.state == .began {
            prevPoint = gestureView.center
            PitchView.revealSlots(val: index)
          }else if gesture.state == .changed {

              let translation = gesture.translation(in: view)

              gestureView.center = CGPoint(
              x: gestureView.center.x + translation.x,
              y: gestureView.center.y + translation.y
              )
              gesture.setTranslation(.zero, in: view)
          }else{
            //PitchView.hideCandies()
            PitchView.hideSlots(val: index)
            let pitchVal = PitchView.trySnap(val: index)
            if pitchVal == -1{
                gestureView.center = prevPoint
                print(gestureView.center.x)
                print(gestureView.center.y)
            }else{
                PitchView.takeSlot(notenum: index, pitchnum: pitchVal)
                if(fSong.getNotes()[index].convertToMIDI() != 0){
                    fSong.getNotes()[index].changePitch(pitchIndex: pitchVal)
                }
                
                if PitchView.checkReady(){
                    Play.isHidden = false
                }
            }

              
          }
    }
    
    @IBAction func BackPitch(_ sender: Any) {
        FeedBtn.isHidden = false
        View.hideAll(val: false)
        
        PitchView.clearAll()
        PitchView.shouldHide(val: true)
        PitchView.hideCandies()
    }
    @IBAction func clearPitch(_ sender: Any) {
        PitchView.clearAll()
        Play.isHidden = true
    }
    
    @IBAction func JarFunction(_ sender: Any) {
        //jarMode = !jarMode
        //ChoiceAppear()
        //let newFly = Firefly(nBody: body, nWing: wing, nTail: tail)
        //PlaybackEngine.makeAndPlaySong(mFirefly: newFly)
        //View.hidePanels(val: true)
        //FireflyAnimator.animateImageOnce(duration: 4.0)
        
        //PitchView.prepareMoveFly()
        //Play.isHidden = true
        SongPlayer.placeSong(song: fSong)
        SongPlayer.playSong()
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

