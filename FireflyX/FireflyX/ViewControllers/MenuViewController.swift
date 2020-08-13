//
//  MenuViewController.swift
//  FireflyX
//
//  Created by admin on 8/10/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import UIKit
protocol AssignTaskDelegate{
    func AssignTask(taskNo: Int)
}
class MenuViewController: UIViewController {
    var delegate: AssignTaskDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Task1(_ sender: Any) {
        delegate?.AssignTask(taskNo: 1)
    }
    
    @IBAction func Task2(_ sender: Any) {
        delegate?.AssignTask(taskNo: 2)
    }
    
    @IBAction func Task3(_ sender: Any) {
        delegate?.AssignTask(taskNo: 3)
    }
    
    @IBAction func Task4(_ sender: Any) {
        delegate?.AssignTask(taskNo: 4)
    }
    
    @IBAction func Task5(_ sender: Any) {
        delegate?.AssignTask(taskNo: 5)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
