//
//  ViewController.swift
//  FireflyX
//
//  Created by Mart on 14/01/2020.
//  Copyright © 2020 Mart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BG: UIImageView!
    
    @IBOutlet weak var BRBG: UIButton!
    
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
    
    @IBOutlet weak var Note1: UIButton!
    
    @IBOutlet weak var Note2: UIButton!
    
    @IBOutlet weak var Note4: UIButton!
    
    @IBOutlet weak var Note8: UIButton!
    
    @IBOutlet weak var Play: UIButton!
    
    @IBOutlet weak var DotTop: UIImageView!
    
    @IBOutlet weak var DotW2: UIImageView!
    
    @IBOutlet weak var DotW1: UIImageView!
    
    @IBOutlet weak var DotBottom: UIImageView!
    
    @IBOutlet weak var HeadTouchArea: UIButton!
    
    @IBOutlet weak var Wing2TouchArea: UIButton!
    
    @IBOutlet weak var Wing1TouchArea: UIButton!
    
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
    
    @IBOutlet weak var Cork: UIButton!
    
    @IBOutlet weak var PitchFly: UIImageView!
    
    @IBOutlet weak var MovingPitchFly: UIImageView!
    
    @IBOutlet weak var ClearButton: UIButton!
    
    @IBOutlet weak var BackButton: UIButton!
    
    @IBOutlet weak var Chat: UIImageView!
    
    @IBOutlet var PGRecognizer0: UIPanGestureRecognizer!
    
    @IBOutlet var PGRecognizer1: UIPanGestureRecognizer!
    
    @IBOutlet var PGRecognizer2: UIPanGestureRecognizer!
    
    @IBOutlet var PGRecognizer3: UIPanGestureRecognizer!
    
    @IBOutlet var PGRecognizer4: UIPanGestureRecognizer!
    
    @IBOutlet var PGRecognizer5: UIPanGestureRecognizer!
    
    @IBOutlet var PGRecognizer6: UIPanGestureRecognizer!
    
    @IBOutlet var PGRecognizer7: UIPanGestureRecognizer!
    
    @IBOutlet weak var ChatSymbolButton: UIButton!
    
    @IBOutlet weak var NextFButton: UIButton!
    
    @IBOutlet weak var jarBody: UIImageView!
    
    @IBOutlet weak var JFly0: UIButton!
    
    @IBOutlet weak var JFly1: UIButton!
    
    @IBOutlet weak var JFly2: UIButton!
    
    @IBOutlet weak var JFly3: UIButton!
    
    @IBOutlet weak var JFly4: UIButton!
    
    @IBOutlet weak var SaveBtn: UIButton!
    
    @IBOutlet weak var LoadBtn: UIButton!
    
    @IBOutlet weak var PauseBg: UIImageView!
    
    @IBOutlet weak var SettingsBtn: UIButton!
    
    @IBOutlet weak var CloseBtn: UIButton!
    
    @IBOutlet weak var ExitBtn: UIButton!
    
    @IBOutlet weak var ToggleWingSymbolBtn: UIButton!
    
    @IBOutlet weak var ToggleChatText: UIImageView!
    
    @IBOutlet weak var ToggleWingText: UIImageView!
    
    @IBOutlet weak var ShowSettingsBtn: UIButton!
    
    @IBOutlet weak var NameField: UITextField!
    
    @IBOutlet weak var Confirm: UIButton!
    
    @IBOutlet weak var NameBG: UIImageView!
    
    @IBOutlet weak var NewJar: UIButton!
    
    @IBOutlet weak var WarnImage: UIImageView!
    
    @IBOutlet weak var YesBtn: UIButton!
    
    @IBOutlet weak var NoBtn: UIButton!
    
    @IBOutlet weak var ToolWood: UIImageView!
    
    var bodyTemp = "Y"
    var wingTemp = 1
    //var tailTemp = 1
    var wing = Wing()
    var body = Body()
    var tail = Tail()
    var restToggle = false
    var previousWhole = false
    var dimensions: [CGFloat] = [150.0,180.0,210.0,240.0,270.0,300.0]
    var prevPoint: CGPoint!
    var fSong: Song!
    var curTail: Int! = 2
    var Songs = Jar()
    var flyCtr = -1
    //var defaultKey = "Jar"
    let uDef = UserDefaults.standard
    let Locks = ProgressLocks()
    var chatView: ChatView!
    var pause: PauseMenuView!
    var TailBtnView: TailButtonsView!
    var W2BtnView: W2ButtonView!
    var JarFlies: JarFirefliesView!
    var LoadedFly: Bool = false
    var LoadedIndex: Int = -1
    var jarName: String!
    var LoadedPitch = false
    var currentTask = -1
    var JarIndex = -1
    var segueIdentifier: String!
    var FB: FBUploader!
    var WarnView: WarningView!
    
    
    @IBOutlet weak var TailPreview: UIImageView!
    //var jarReady = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ChangeTopTouchSize()
        
        TailBtnView = TailButtonsView(T0: Tail0, T1: Tail1, T2: Tail2, T3: Tail3, T4: Tail4)
        W2BtnView = W2ButtonView(W20: Note1, W21: Note2, W22: Note4, W23: Note8)
        JarFlies = JarFirefliesView(J0: JFly0, J1: JFly1, J2: JFly2, J3: JFly3, J4: JFly4)
        
        View.setMainImages(firefly: FireflyImage, body: BodyWood, wing1: Wing1Wood, wing2: Wing2Wood, tail: TailWood,wingArrow: Arrow2, tailArrow: Arrow,rLever: RestLever,bOptions: BodyOptions, w1Options: Wing1Options, w2Options: Wing2Options, tOptions: TailOptions, tailPreview: TailPreview)

        View.setButtonsAndDots(feedButton: FeedBtn, headArea: HeadTouchArea, wing1Area: Wing1TouchArea, wing2Area: Wing2TouchArea, tailArea: TailTouchArea,dotTop: DotTop, dotWing1: DotW1, dotWing2: DotW2, dotTail: DotBottom)
        View.setJarStuff(JF: JarFlies, Cork: Cork,JB: jarBody)
        //View.setArrow(wingArrow: Arrow2, tailArrow: Arrow)
        FireflyAnimator.setImage(flyImageView: PitchFly ,support: FireFlySupport)
        
        PitchView.setPitchImages(staffImage: Staff, pitchFlyImage: PitchFly, candy0Image: Candy0, candy1Image: Candy1, candy2Image: Candy2, candy3Image: Candy3, candy4Image: Candy4, candy5Image: Candy5, candy6Image: Candy6, candy7Image: Candy7, moveFly: MovingPitchFly, back: BackButton, clear: ClearButton, play: Play, next: NextFButton,settings: ShowSettingsBtn, save: SaveBtn)
        
        chatView = ChatView(chatImage: Chat)
        
        
        pause = PauseMenuView(brbg: BRBG,bg: PauseBg,load: LoadBtn, set: SettingsBtn, toggleC: ToggleChatText, toggleW: ToggleWingText, toggleCBtn: ChatSymbolButton, toggleWBtn: ToggleWingSymbolBtn, exit: ExitBtn, x: CloseBtn, name: NameField, confirm: Confirm, NBG: NameBG,NewJarBtn: NewJar)
        //let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        pause.adjustLayers(view: self.view)
        pause.unpause()
        //pause.startName()
        //lockProgress()
        
        WarnView = WarningView(warn: WarnImage, yes: YesBtn, no: NoBtn, bg: BRBG, ok: Confirm)
        WarnView.bringToFront(view: self.view)
        WarnView.hideWarn()
        View.toggleBodyTouch(val: true)
        FB = FBUploader()
        PitchView.setOrigpointsAndAutoFormatConstraints()
        addSlots()
        
        //currentTask = -1
        //LoaderAndSaver.saveTask(Songs: [Jar](), key: StringKeys.KeyForJars(task: currentTask))
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //print("viewDidAppear\(currentTask)")

        if currentTask == -1{
            //print("test")
            goToTaskScreen()
            currentTask = 1
        }
        
    }

    func goToTaskScreen(){
        segueIdentifier = StringKeys.MainToMenu
        performSegue(withIdentifier: segueIdentifier, sender: self)
        
        
    }
    @IBAction func openJar(_ sender: Any) {
        if(flyCtr > 0){
            WarnView.showWarn(mode: 9)
        }else{
            WarnView.showWarn(mode: 0)
        }
    }
    
    func startEditing(){
        //StartingJar.isHidden = true
        View.toggleBodyDot(val: false)
        //DotTop.isHidden = false
        FireflyImage.isHidden = false
        //EndingJar.isHidden = false
        
        //ChatOption.isHidden = false
        JFly0.isHidden = true
        flyCtr+=1
        View.toggleBodyTouch(val: false)
    }
    
    
    func startPlayback(){
        //let time = NSDate().timeIntervalSince1970
        FB.uploadJar(jar:Songs)
        PitchView.clearAll()
        PitchView.shouldHide(val: false)
        View.hideAll(val: true)
        JarFlies.hideAllFlies()
        View.hideCork(val: true)
        chatView.forcedHideChat()
        //print("open jar")
        //print(Songs.MakeFullSong().count)
        
        //print(Songs.getSongs()[0].getNotes()[0].convertToMIDI())
        //print(Songs.getSongs()[0].getNotes()[0].getPitchIndex())
        PitchView.showCandies(notes: Songs.getSongs()[0].getNotes())
        
        //print(Songs.getSongs()[0].getRepeatedNotes().count)
        //PitchView.prepareMoveFly()
        SongPlayer.placeFullSong(jar: Songs,Vc: self)
        SongPlayer.playSong()
        
    }
    
    func addSlots(){
        
        var pSlots = [[PitchSlot]]()
        for i in 0 ... 7{
            var array = [PitchSlot]()
            let slotImage  = UIImage(named: "slot")
            for j in 0 ... 12{
                var imageView : UIImageView
                let staffRatio = Double(Staff.frame.height) * 0.12
                //let xM: Double = Double((110 * i) + 50)
                let xM: Double = Double((90 * i) + 50)
                let yM: Double = Double((staffRatio * Double(j)) - (staffRatio * 1.9))
                let height = Candy0.frame.height/3
                let width = Candy0.frame.width/3
                
                
                imageView  = UIImageView(frame: CGRect(x: CGFloat(xM) + Staff.frame.origin.x, y: CGFloat(yM) + Staff.frame.origin.y , width : width, height: height))
                imageView.image = slotImage
                var newSlot: PitchSlot
                if j == 0 || j == 12{
                    let edgeImage  = UIImage(named: "edgeline")
                    
                    let edgeLineView = UIImageView(frame: CGRect(x:  0, y: 0, width : width * 2.0, height: height))
                    edgeLineView.image = edgeImage
                    newSlot = PitchSlot(pitchslot: imageView, edgeLine: edgeLineView)
                    edgeLineView.isHidden = true
                    //self.view.addSubview(edgeLineView)
                    self.view.insertSubview(edgeLineView, belowSubview: Candy0)
                }else{
                    newSlot = PitchSlot(pitchslot: imageView)
                }
                array.append(newSlot)
                imageView.isHidden = true
                self.view.addSubview(imageView)
                self.view.insertSubview(imageView, belowSubview: Candy0)
            }
            pSlots.append(array)
        }
        PitchView.setSlots(slotArray: pSlots)
        
    }

    
    
    func lockProgress(){
        Locks.reset()
        View.tailArrowAppear(val: false)
        View.wingArrowAppear(val: false)

        
        if(flyCtr>0){
            DotTop.isHidden = false
        }
        
        View.toggleBody(val:true)
        View.toggleBodyTouch(val: false)
        
        View.toggleWing1(val:true)
        View.toggleWing1Touch(val:true)
        
        View.toggleWing2Touch(val:true)
        View.toggleWing2(val:true)
        
        View.toggleTailTouch(val:true)
        View.toggleTail(val:true)
        
        //Play.isHidden = true
        View.toggleFeed(val: true)
    }


 
    
    @IBAction func RedBody(_ sender: Any) {
        if bodyTemp != "R"{
            preWarnCheckBodyChange(Bcolor: "R")
        }
    }

    @IBAction func YellowBody(_ sender: Any) {
        if bodyTemp != "Y"{
            preWarnCheckBodyChange(Bcolor: "Y")
        }
        if (flyCtr == 0){
            bodyChange(Bcolor: "Y")
        }
    }
    
    
    @IBAction func GreenBody(_ sender: Any) {
        if bodyTemp != "G"{
            preWarnCheckBodyChange(Bcolor: "G")
        }
        //preWarnCheckBodyChange(Bcolor: "G")
        
    }
    func preWarnCheckBodyChange(Bcolor:String){
        if flyCtr > 0{
            bodyTemp = Bcolor
            WarnView.showWarn(mode: 3)
        }else{
            bodyChange(Bcolor: Bcolor)
        }
        
    }
    func bodyChange(Bcolor:String){
        
        bodyTemp = Bcolor
        JarFlies.changeImage(bodyTemp: bodyTemp)
        chatView.chatChangeHead(bodyTemp: bodyTemp)
        body.setColor(color: Lookups.colorsLookup(color: bodyTemp))
        Songs.changeSongsTempo(color: Lookups.colorsLookup(color: bodyTemp))
        UpdateImage()
        TailBtnView.UpdateTailOptions(isSingle: previousWhole,bodyTemp: bodyTemp)
        if(Locks.unlockW()){
            
            View.toggleWing2Touch(val:false)
            View.toggleWing1Touch(val:false)
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

    func changeWingSizeAndUnlockTail1(num:Int){
        //chatChangeSize(num: num)
        changeWingSize(num: num)
        if(Locks.unlockT1()){
            //arrow2Appear = true
            checkTailLock()
        }
        chatView.chatChangeSize(num: num,bodyTemp: bodyTemp)
    }
    func changeWingSize(num:Int){
        wingTemp = num
        
        wing.setRepetitions(repetitions: num)
        UpdateImage()
        ChangeTopTouchSize()
    }
    
    func checkTailLock(){
        if Locks.checkT(){
            View.toggleTailTouch(val:false)
        }
    }
 
    @IBAction func WNote1(_ sender: Any) {
        changeToW()
    }
    func changeToW(){
        if !restToggle {
            wing.firstNote = NoteType.whole
        }else{
            wing.firstNote = NoteType.wholeRest
        }
        changeFirstNote(fNoteIndex: 1)
        if Locks.checkT(){
            changeTail(index: 2,fromTail: false)
        }
        
        //MoveArrow(mArrow: Arrow, stack: TailOptions, Sindex: 2)
        
        View.moveTailArrow(Sindex: 2)
    }
    
    @IBAction func WNote2(_ sender: Any) {
        changeToH()
        
    }
    func changeToH(){
        if !restToggle {
            wing.firstNote = NoteType.half
        }else{
            wing.firstNote = NoteType.halfRest
        }
        changeFirstNote(fNoteIndex: 2)
        if !Locks.checkP(){
            changeTail(index: tail.getBeatIndex(),fromTail: false)
        }
    }
    
    @IBAction func WNote4(_ sender: Any) {

        changeToQ()
    }
    func changeToQ(){
        if !restToggle {
            wing.firstNote = NoteType.quarter
        }else{
            wing.firstNote = NoteType.quarterRest
        }
        changeFirstNote(fNoteIndex: 3)
        if !Locks.checkP(){
            changeTail(index: tail.getBeatIndex(),fromTail: false)
        }
    }
    
    @IBAction func WNote8(_ sender: Any) {
        changeToE()
        
    }
    func changeToE(){
        if !restToggle {
            wing.firstNote = NoteType.eighth
        }else{
            wing.firstNote = NoteType.eighthRest
        }
        changeFirstNote(fNoteIndex: 4)
        if !Locks.checkP(){
            changeTail(index: tail.getBeatIndex(),fromTail: false)
        }
        
    }
    
    func changeFirstNote(fNoteIndex: Int){
        View.wingArrowAppear(val: true)
        if(restToggle){
            chatView.chatChangeFNoteRest(num: fNoteIndex,bodyTemp: bodyTemp)
        }else{
            chatView.chatChangeFNote(num: fNoteIndex,bodyTemp: bodyTemp)
        }
        if fNoteIndex == 1{
            if !previousWhole{
                TailBtnView.ChangeTailOptionsCount(isWhole: true, bodyTemp: bodyTemp)
                previousWhole = true
            }
        }else{
            if previousWhole{
                TailBtnView.ChangeTailOptionsCount(isWhole: false, bodyTemp: bodyTemp)
                previousWhole = false
            }
        }
        if(Locks.unlockT2()){
            checkTailLock()
        }
        View.moveWingArrow(Sindex: fNoteIndex - 1)
        //MoveArrow(mArrow: Arrow2, stack: Wing2Options, Sindex: fNoteIndex - 1)
        
    }
 
    @IBAction func ToggleRest(_ sender: Any) {
        
        ChangeRest()
    }
    
    func ChangeRest(){
        restToggle = !restToggle
        switch (wing.firstNote){
        case .eighth:
            wing.firstNote = .eighthRest
        case .eighthRest:
            wing.firstNote = .eighth
        case .quarter:
            wing.firstNote = .quarterRest
        case .quarterRest:
            wing.firstNote = .quarter
        case .half:
            wing.firstNote = .halfRest
        case .halfRest:
            wing.firstNote = .half
        case.whole:
            wing.firstNote = .wholeRest
        case.wholeRest:
            wing.firstNote = .whole
        }
        
        if restToggle{
            RestLever.setImage(UIImage(named:"rightLever"), for: .normal)
            chatView.chatChangeLeverToRest(bodyTemp: bodyTemp)
        }else{
            RestLever.setImage(UIImage(named:"leftLever"), for: .normal)
            chatView.chatChangeLeverToNote(bodyTemp: bodyTemp)
        }
        W2BtnView.UpdateWingOptionsImages(isRest: restToggle)
        UpdateImage()
        tail.setBeatPattern(beatType: wing.getNFirstNote(), Bindex: curTail)
    }
    
    
    
    @IBAction func TailButton0(_ sender: Any) {
        changeTail(index: 0,fromTail: true)
        
        //MoveArrow(button: Tail0)
    }
    
    @IBAction func TailButton1(_ sender: Any) {
        changeTail(index: 1,fromTail: true)
        
        //MoveArrow(button: Tail1)
    }
    
    @IBAction func TailButton2(_ sender: Any) {
        changeTail(index: 2,fromTail: true)
        
        //MoveArrow(button: Tail2)
    }
    @IBAction func TailButton3(_ sender: Any) {
        changeTail(index: 3,fromTail: true)
        
        //MoveArrow(button: Tail3)
    }
    
    @IBAction func TailButton4(_ sender: Any) {
        changeTail(index: 4,fromTail: true)
        
        //MoveArrow(button: Tail4)
    }
    
    func changeTail(index:Int,fromTail:Bool){
        curTail = index
        Chat.isHidden = true
        tail.setBeatPattern(beatType: wing.getNFirstNote(), Bindex: index)
        
        
        //MoveArrow(mArrow: Arrow, stack: TailOptions, Sindex: index)
        //arrowApppear =  true
        if fromTail{
            if(Locks.unlockP()){
                View.toggleFeed(val: false)
                //Play.isHidden = false
            }
            View.tailArrowAppear(val: true)
            print("TAIL")
        }
        //View.tailArrowAppear(val: true)
        View.changeTailPreview(isRest: restToggle, NoteValue: Lookups.NoteValueLookup(type: wing.getNFirstNote()) , BeatIndex: tail.getBeatIndex())
        View.moveTailArrow(Sindex: index)
    }
    
    @IBAction func HeadTouch(_ sender: Any) {
        
        View.toggleBody(val:!BodyWood.isHidden)
        //DotTop.isHidden = true
        View.toggleBodyDot(val: true)
    }
    
    @IBAction func Wing2Touch(_ sender: Any) {
        View.toggleWing2(val:!Wing2Wood.isHidden)
        View.toggleW2Dot(val: true)
        //DotW2.isHidden = true
    }
    
    @IBAction func Wing1Touch(_ sender: Any) {
        View.toggleWing1(val:!Wing1Wood.isHidden)
        View.toggleW1Dot(val: true)
        //DotW1.isHidden = true
    }
    
    @IBAction func TailTouch(_ sender: Any) {
        
        View.toggleTail(val:!TailWood.isHidden)
        View.toggleTDot(val: true)
        //DotBottom.isHidden = true
    }



    func UpdateImage(){
        //FireflyAnimator.ResetAnimate()
        var fireflyPic: UIImage!
        if  restToggle{
            fireflyPic = UIImage(named: "\(bodyTemp)W\(wingTemp)T1R")
            FireflyImage.image = fireflyPic
            FireflyAnimator.setAnimationMode(isRest: true)
            
            
            PitchFly.image = fireflyPic
            MovingPitchFly.image = UIImage(named: "\(bodyTemp)W1T1R")
 
        }else{
            fireflyPic = UIImage(named: "\(bodyTemp)W\(wingTemp)T1")
            
            FireflyImage.image = fireflyPic
            FireflyAnimator.setAnimationMode(isRest: false)

            
            PitchFly.image = fireflyPic
            MovingPitchFly.image = UIImage(named: "\(bodyTemp)W1T1")
        }
        FireflyAnimator.setOGImage(image: fireflyPic)
        //FireFlySupport.center = PitchFly.center
        var pic: UIImage!
        pic = UIImage(named: "\(bodyTemp)W\(wingTemp)T1R")
        FireflyAnimator.setRestImage(image: pic)
        
        let prefix = "\(bodyTemp)W\(wingTemp)C"
        FireflyAnimator.setIarray(ImageCount: 8, ImagePrefix: prefix)
        
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
                //print(gestureView.center.x)
                //print(gestureView.center.y)
            }else{
                PitchView.takeSlot(notenum: index, pitchnum: pitchVal)
                if(fSong.getNotes()[index].isRest()){
                    fSong.getNotes()[index].changePitch(pitchIndex: 12)
                    //12 is rest
                }else{
                    fSong.getNotes()[index].changePitch(pitchIndex: pitchVal)
                    SongPlayer.playNote(note: fSong.getNotes()[index])
                }
                
                PitchView.checkReady()
            }

              
          }
    }
    @IBAction func ShowPitch(_ sender: Any) {
        
        PitchView.shouldHide(val: false)
        
        View.hideAll(val: true)
        //FeedBtn.isHidden = true
        let newFly = Firefly(nBody: body, nWing: wing, nTail: tail)
        fSong = PlaybackEngine.makeSongnoPitch(mFirefly: newFly)
        PitchView.showCandies(notes: fSong.getNotes())
        chatView.forcedHideChat()
        
        PitchView.checkReady()
        if currentTask == 2{
            WarnView.showWarn(mode: 2)
            PitchView.disableCandies()
        }
        
        
        if !LoadedFly{
            Songs.addSong(song: fSong)
            flyCtr+=1
            LoadedFly = true
            LoadedIndex = Songs.getSongs().count - 1
            JarFlies.hideFly(index: Songs.getSongs().count - 1, val: true)
            //JarFlies.hideFly(index: LoadedIndex, val: false)
            
        }else{
            Songs.replace(index: LoadedIndex, song: fSong)

        }
        saveJar()
        if flyCtr > 4{
            PitchView.setFull(val: true)
        }else{
            PitchView.setFull(val: false)
        }
    }
    @IBAction func BackPitch(_ sender: Any) {
        //print("test")
        backFromPitch()
    }
    func backFromPitch(){
        //FeedBtn.isHidden = false
        
        //print("hello")
        View.hideAll(val: false)
        
        //PitchView.clearAll()
        //PitchView.hideCandies()
        PitchView.clearAll()
        PitchView.shouldHide(val: true)
        //PitchFly.isHidden = true
        //FireFlySupport.isHidden = true
        //NextFButton.isHidden = true
        
        
    }
    @IBAction func clearPitch(_ sender: Any) {
        PitchView.clearAll()
        fSong.removePitch()
        PitchView.showCandies(notes: fSong.getNotes())
    }
    
    @IBAction func PreviewPitch(_ sender: Any) {

        
        //PitchView.prepareMoveFly(forPreview: true)
        Play.isHidden = true
        //print(fSong.getRepeatedNotes().count)
        SongPlayer.placeSong(song: fSong)
        SongPlayer.playSong()
    }

    @IBAction func funcHideOrShowChat(_ sender: Any) {
        pause.changeChatButtonImage(val: chatView.hideShowChat())

    }
    
    @IBAction func NextFly(_ sender: Any) {
        WarnView.showWarn(mode: 1)
        //PitchView.clearAll()
    }
    @IBAction func SaveJar(_ sender: Any) {
        WarnView.showWarn(mode: 7)
        saveButtonAction()
        //uDef.set(Songs, forKey: defaultKey)
    }
    func saveButtonAction(){
        Songs.replace(index: LoadedIndex, song: fSong)
        saveJar()
    }
    
    func saveJar(){
        
        let key = StringKeys.KeyForJars(task: currentTask)
        var tempJars = LoaderAndSaver.loadTask(key:key)
        if JarIndex == -1{
            tempJars.append(Songs)
            JarIndex = tempJars.count - 1
        }else{
            tempJars[JarIndex] = Songs
        }
        LoaderAndSaver.saveTask(Songs: tempJars, key: key)

    }
 
    func NextFlyAction(){
        backFromPitch()
        //Songs.replace(index: LoadedIndex, song: fSong)
        JarFlies.hideFly(index: LoadedIndex, val: false)
        
            //reset except locks
        resetViewWithSelectedColor()
        LoadedFly = false
    }
    
    @IBAction func showPauseMenu(_ sender: Any) {
        pause.showPause()
    }
    
    @IBAction func showSettingsMenu(_ sender: Any) {
        pause.showSettings()
    }
    
    @IBAction func hidePauseMenu(_ sender: Any) {
        exitPause()
    }
    
    @IBAction func BlackBackground(_ sender: Any) {
        if(pause.isPaused()){
            exitPause()
        }
        
    }
    
    func exitPause(){
        pause.unpause()
    }
    
    @IBAction func ExitTask(_ sender: Any) {
        pause.unpause()
        WarnView.showWarn(mode: 6,view: self.view)
        
    }
    @IBAction func ConfirmAction(_ sender: Any) {
    
        if pause.getStartMode(){
            let name = pause.getName()
            if name != ""{
                jarName = "Task \(currentTask): \(name)"
                Songs.setName(s: jarName)
                pause.endName()
                
            }
        }else{
            pause.adjustLayers(view: self.view)
            WarnView.bringToFront(view: self.view)
            let num = WarnView.getWarnMode()
            WarnView.endWarn()
            if num == 4{
                pause.showPause()
            }
            
        }
        
    }
    
    @IBAction func NoWarn(_ sender: Any) {
        if WarnView.getWarnMode() == 3{
            bodyTemp = Lookups.colorsStringLookup(color: body.getColor())
            
        }
        pause.adjustLayers(view: self.view)
        WarnView.bringToFront(view: self.view)
        switch WarnView.getWarnMode(){
        case 5,6,8:
            
            WarnView.endWarn()
            pause.showPause()
        default:
            WarnView.endWarn()
        }

    }
    
    @IBAction func YesWarn(_ sender: Any) {
        //WarnView.endWarn()
        pause.adjustLayers(view: self.view)
        WarnView.bringToFront(view: self.view)
        switch(WarnView.getWarnMode()){
        case 1:
            //next fly
            
            NextFlyAction()
            WarnView.endWarn()
        case 3:
            //color
            bodyChange(Bcolor: bodyTemp)
            WarnView.endWarn()
        case 5:
            //new jar
            WarnView.endWarn()
            newJar()
        case 8:
            //load
            WarnView.endWarn()
            loadButtonAction()
        case 9:
            WarnView.endWarn()
            startPlayback()
        default:
            //exit
            WarnView.endWarn()
            pause.unpause()
            pause.showPause()
            goToTaskScreen()
            
        }
        
    }
    
    @IBAction func makeNewJar(_ sender: Any) {
        pause.unpause()
        WarnView.showWarn(mode: 5,view: self.view)
        
    }
    func newJar(){
        backFromPitch()
        body = Body()
        bodyTemp = "Y"
        bodyChange(Bcolor: "Y")
        resetMainView()
        
        
        

        pause.unpause()
        View.hideAll(val: true)
        View.toggleBodyTouch(val: true)
        flyCtr = -1
        JarIndex = -1
        
        JarFlies.hideAllFlies()
        JarFlies.hideFly(index: 0, val: false)
        chatView.forcedHideChat()
        
        pause.startName()
        
        
    }
    
    @IBAction func ChangeWingSymbols(_ sender: Any) {
        pause.changeWOptionBtnImage(val: W2BtnView.changeWingOptionsImages(isRest: restToggle))
    }
    
    @IBAction func JFly0Load(_ sender: Any) {
        if flyCtr < 0{
            startEditing()
        }else{
            LoadFlyInJar(index: 0)
        }
        
    }
    
    @IBAction func JFly1Load(_ sender: Any) {
        LoadFlyInJar(index: 1)
    }
    
    @IBAction func JFly2Load(_ sender: Any) {
        LoadFlyInJar(index: 2)
    }
    
    @IBAction func JFly3Load(_ sender: Any) {
        LoadFlyInJar(index: 3)
    }
    
    @IBAction func JFly4Load(_ sender: Any) {
        LoadFlyInJar(index: 4)
    }
    
    func LoadFlyInJar(index: Int){
        if LoadedFly{
            //Songs.replace(index: LoadedIndex, song: fSong)
            //saveJar()
            JarFlies.hideFly(index: LoadedIndex, val: false)
        }
        backFromPitch()
        lockProgress()
        skipFirstProgressStep()
        JarFlies.hideFly(index: index, val: true)
        LoadedFly = true
        LoadedIndex = index
          
        fSong = Songs.getSongAtIndex(index: index)
        changeWingSizeAndUnlockTail1(num: fSong.getRepetitions())
        
        if fSong.getNotes()[0].isRest() != restToggle{
            ChangeRest()
        }
        switch fSong.getNotes()[0].getValue(){
        case 8:
            changeToW()
        case 4:
            changeToH()
        case 2:
            changeToQ()
        default:
            changeToE()
        }
        changeTail(index: fSong.getFirefly().getTail().beatIndex , fromTail: true)
        View.hideAll(val: true)
        PitchView.shouldHide(val: false)
          //FeedBtn.isHidden = true
        PitchView.showCandies(notes: fSong.getNotes())
        if currentTask == 2{
            WarnView.showWarn(mode: 2)
            PitchView.disableCandies()
        }
        chatView.forcedHideChat()
        PitchView.checkReady()
        if flyCtr > 4{
            PitchView.setFull(val: true)
        }else{
            PitchView.setFull(val: false)
        }


    }
    func skipFirstProgressStep(){
        View.toggleBody(val: false)
        bodyChange(Bcolor: bodyTemp)
        DotTop.isHidden = true
    }
    
    func resetViewWithSelectedColor(){
        //backFromPitch()
        resetMainView()
        
        skipFirstProgressStep()
    }
    func resetMainView(){
        wing = Wing()
        body = Body()
        tail = Tail()
        changeWingSize(num: 1)
        wingTemp = 1
        if restToggle {
            ChangeRest()
        }
        lockProgress()
    }
    @IBAction func goToLoadScreen(_ sender: Any) {
        let tempJars = LoaderAndSaver.loadTask(key:StringKeys.KeyForJars(task: currentTask))
        pause.unpause()
        if tempJars.count != 0{
            WarnView.showWarn(mode: 8,view: self.view)
        }else{
            WarnView.showWarn(mode: 4,view: self.view)
        }
        
        
    }
    func loadButtonAction(){
        segueIdentifier = StringKeys.MainToLoad
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segueIdentifier == StringKeys.MainToLoad{
            let vc = segue.destination as! LoadViewController
            vc.delegate = self
            let tempJars = LoaderAndSaver.loadTask(key:StringKeys.KeyForJars(task: currentTask))
            //vc.viewDidLoad()
            vc.InitialLoad(jar: tempJars)
        }else{
            let vc = segue.destination as! MenuViewController
            vc.delegate = self
            
        }
    }
    func loadJar(newJar:Jar,jarIndex:Int){
        
        if flyCtr == -1{
            startEditing()
        }
        Songs = newJar
        JarIndex = jarIndex
        flyCtr = newJar.getSongs().count
        JarFlies.loadFlies(count: Songs.getSongs().count-1)
        bodyChange(Bcolor: Lookups.colorsStringLookup(color: Songs.getSongs()[0].getFirefly().body.getColor()))
        
        LoadFlyInJar(index: Songs.getSongs().count - 1)
        
    }

}


extension ViewController: LoadJarDelegate{
    func LoadJar(Jar: Jar, JarIndex: Int) {
        self.dismiss(animated: true){
            self.exitPause()
            self.loadJar(newJar: Jar, jarIndex: JarIndex)
        }
        
    }
}
extension ViewController: AssignTaskDelegate{
    func AssignTask(taskNo: Int) {
        self.dismiss(animated: true){
            self.currentTask = taskNo
            self.newJar()
            //print(self.currentTask)
        }
    }
}


