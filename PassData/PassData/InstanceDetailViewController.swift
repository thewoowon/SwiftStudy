//
//  InstanceDetailViewController.swift
//  PassData
//
//  Created by woowon on 2022/01/26.
//

import UIKit

class InstanceDetailViewController: UIViewController {
    
    var mainVc: ViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendDataMainVc(_ sender: Any) {
        mainVc?.dataLabel.text = "Some Data"
        self.dismiss(animated: true, completion: nil) // 페이지 해고 -> 사라짐
    }
}
