//
//  DelegateDetailViewController.swift
//  PassData
//
//  Created by woowon on 2022/01/26.
//

import UIKit

protocol DelegateDetailViewControllerDelegate :AnyObject{
    func passString(string:String)
}

class DelegateDetailViewController: UIViewController {
    
    weak var delegate:DelegateDetailViewControllerDelegate?
    // 약한 참조
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func passDetailMainVc(_ sender: Any) {
        delegate?.passString(string: "Delegate Pass Data")
        
    }
}
