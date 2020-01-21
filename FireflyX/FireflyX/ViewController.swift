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
    
    var body = "R"
    var wing = 1
    var tail = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func RedBody(_ sender: Any) {
        body = "R"
        UpdateImage()
        
    }
    
    @IBAction func OrangeBody(_ sender: Any) {
        body = "O"
        UpdateImage()
        
    }
    
    
    @IBAction func YellowBody(_ sender: Any) {
        body = "Y"
        UpdateImage()
        
    }
    
    
    @IBAction func GreenBody(_ sender: Any) {
        body = "G"
        UpdateImage()
        
    }
    
    @IBAction func BlueBody(_ sender: Any) {
        body = "B"
        UpdateImage()
        
    }
    
    @IBAction func IndigoBody(_ sender: Any) {
        body = "I"
        UpdateImage()
        
    }
    
    @IBAction func VioletBody(_ sender: Any) {
        body = "V"
        UpdateImage()
        
    }
    
    @IBAction func WSize1(_ sender: Any) {
        wing = 1
        UpdateImage()
        
    }
    
    
    @IBAction func WSize2(_ sender: Any) {
        wing = 2
        UpdateImage()
        
    }
    
    @IBAction func WSize3(_ sender: Any) {
        wing = 3
        UpdateImage()
        
    }
    
    @IBAction func WSize4(_ sender: Any) {
        wing = 4
        UpdateImage()
        
    }
    
    @IBAction func WSize5(_ sender: Any) {
        wing = 5
        UpdateImage()
        
    }
    
    @IBAction func WSize6(_ sender: Any) {
        wing = 6
        UpdateImage()
        
    }
    func UpdateImage(){
        FireflyImage.image = UIImage(named: "\(body)W\(wing)T\(tail)")
    }
}

