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
    
    
    
    var bodyTemp = "R"
    var wingTemp = 1
    var tailTemp = 1
    var body = Body()
    var wing = Wing()
    var JarMode = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func RedBody(_ sender: Any) {
        bodyTemp = "R"
        UpdateImage()
        
    }
    
    @IBAction func JarFunction(_ sender: Any) {
        JarMode = !JarMode
        ChoiceAppear()
    }
    @IBAction func OrangeBody(_ sender: Any) {
        bodyTemp = "O"
        UpdateImage()
        
    }
    
    
    @IBAction func YellowBody(_ sender: Any) {
        bodyTemp = "Y"
        UpdateImage()
        
    }
    
    
    @IBAction func GreenBody(_ sender: Any) {
        bodyTemp = "G"
        UpdateImage()
        
    }
    
    @IBAction func BlueBody(_ sender: Any) {
        bodyTemp = "B"
        UpdateImage()
        
    }
    
    @IBAction func IndigoBody(_ sender: Any) {
        bodyTemp = "I"
        UpdateImage()
        
    }
    
    @IBAction func VioletBody(_ sender: Any) {
        bodyTemp = "V"
        UpdateImage()
        
    }
    
    @IBAction func WSize1(_ sender: Any) {
        wingTemp = 1
        UpdateImage()
        
    }
    
    
    @IBAction func WSize2(_ sender: Any) {
        wingTemp = 2
        UpdateImage()
        
    }
    
    @IBAction func WSize3(_ sender: Any) {
        wingTemp = 3
        UpdateImage()
        
    }
    
    @IBAction func WSize4(_ sender: Any) {
        wingTemp = 4
        UpdateImage()
        
    }
    
    @IBAction func WSize5(_ sender: Any) {
        wingTemp = 5
        UpdateImage()
        
    }
    
    @IBAction func WSize6(_ sender: Any) {
        wingTemp = 6
        UpdateImage()
        
    }
    func UpdateImage(){
        FireflyImage.image = UIImage(named: "\(bodyTemp)W\(wingTemp)T\(tailTemp)")
    }
    
    func ChoiceAppear(){
        BodyWood.isHidden = JarMode
        BodyOptions.isHidden = JarMode
        Wing1Wood.isHidden = JarMode
        Wing1Options.isHidden = JarMode
        Wing2Wood.isHidden = JarMode
        Wing2Options.isHidden = JarMode
        if JarMode {
            
        }
    }
}

