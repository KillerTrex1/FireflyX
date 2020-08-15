//
//  LoadViewController.swift
//  FireflyX
//
//  Created by admin on 8/12/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import UIKit
protocol LoadJarDelegate{
    func LoadJar(Jar:Jar, JarIndex: Int)
}
class LoadViewController: UIViewController {
    
    
    
    

    @IBOutlet weak var Wood0: UIButton!
    
    @IBOutlet weak var Wood1: UIButton!
    
    @IBOutlet weak var Wood2: UIButton!
    
    @IBOutlet weak var Text0: UILabel!
    
    @IBOutlet weak var Text1: UILabel!
    
    @IBOutlet weak var Text2: UILabel!
    
    @IBOutlet weak var Fly0: UIImageView!
    
    @IBOutlet weak var Fly1: UIImageView!
    
    @IBOutlet weak var Fly2: UIImageView!
    
    @IBOutlet weak var BackArrow: UIButton!
    
    @IBOutlet weak var NextArrow: UIButton!
    
    @IBOutlet weak var Back: UIButton!
    
    @IBOutlet weak var Load: UIButton!
    
    var TaskJars: [Jar]!
    var woods = [UIButton]()
    var texts = [UILabel]()
    var flies = [UIImageView]()
    let uDef = UserDefaults.standard
    var curPage = 0
    var selected = 0
    var delegate: LoadJarDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupWoods()
        loadPages()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func setupWoods(){
        woods.append(Wood0)
        woods.append(Wood1)
        woods.append(Wood2)
        texts.append(Text0)
        texts.append(Text1)
        texts.append(Text2)
        flies.append(Fly0)
        flies.append(Fly1)
        flies.append(Fly2)
    }
    @IBAction func Back(_ sender: Any) {
        curPage-=1
        changePage()
    }
    
    @IBAction func Next(_ sender: Any) {
        curPage+=1
        changePage()
    }
    func changePage(){
        loadPages()
        selectWood(val: 0)
    }
    @IBAction func BackToMain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func LoadJarInMain(_ sender: Any) {
        let selectedIndex = (curPage * 3) + selected
        delegate?.LoadJar(Jar: TaskJars[selectedIndex], JarIndex: selectedIndex)
        //self.dismiss(animated: true, completion: nil)
    }
    
    func InitialLoad(jar: [Jar]){
        TaskJars = jar

        curPage = 0
        print(jar.count)
    }
    func loadPages(){
        let maxPage = (TaskJars.count - 1) / 3
        var itemCount = 3
        print("\(maxPage)MAX")
        print("\(curPage)CURR")
        if curPage == maxPage{
            itemCount = TaskJars.count - (curPage * 3)
             NextArrow.isHidden = true
        }else{
            NextArrow.isHidden = false
        }
        for i in 0..<3{
            if i < itemCount{
                hideWood(val: false, index: i)
                texts[i].text = TaskJars[(curPage * 3)+i].getName()
            }else{
                hideWood(val: true, index: i)
            }
            
        }
        if curPage == 0{
            BackArrow.isHidden = true
        }else{
            BackArrow.isHidden = false
        }
    }
    
    func hideWood(val:Bool,index: Int){
        woods[index].isHidden = val
        texts[index].isHidden = val
    }
    @IBAction func Select0(_ sender: Any) {
        selectWood(val: 0)
    }
    @IBAction func Select1(_ sender: Any) {
        selectWood(val: 1)
        
    }
    
    @IBAction func Select2(_ sender: Any) {
        selectWood(val: 2)
    }
    func selectWood(val: Int){
        selected = val
        for i in 0..<3{
            if i == selected{
                flies[i].isHidden = false
            }else{
                flies[i].isHidden = true
            }
        }
    }
    
}
