//
//  JarFirefliesView.swift
//  FireflyX
//
//  Created by admin on 8/7/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import UIKit
class JarFirefliesView{
    var JFlies: [UIButton]
    var doneFlies: Int!
    init(J0: UIButton,J1: UIButton,J2: UIButton,J3: UIButton,J4: UIButton){
        JFlies = [UIButton]()
        JFlies.append(J0)
        JFlies.append(J1)
        JFlies.append(J2)
        JFlies.append(J3)
        JFlies.append(J4)
        doneFlies = 0
    }
    
    func changeImage(bodyTemp: String){

        for Fly in JFlies{
            Fly.setImage(UIImage(named:"J\(bodyTemp)Fly"), for: .normal)
        }
    }
    
    func hideFly(index: Int, val: Bool){
        if index + 1 > doneFlies{
            doneFlies = index + 1
        }
        if index < JFlies.count && index >= 0{
            JFlies[index].isHidden = val
        }
    }
    func loadFlies(count: Int){
        doneFlies = count
        for i in 0..<count{
            JFlies[i].isHidden = false
        }
    }
    func hideAllFlies(){
        for i in 0..<JFlies.count{
            JFlies[i].isHidden = true
        }
    }
    func showDoneFlies(){
        for i in 0..<doneFlies{
            JFlies[i].isHidden = false
        }
    }
    
    func resetFLies(){
        hideAllFlies()
        doneFlies = 0
    }
}
