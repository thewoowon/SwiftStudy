//
//  ClosureDetailViewController.swift
//  PassData
//
//  Created by woowon on 2022/01/26.
//

import UIKit

class ClosureDetailViewController: UIViewController {
    
    var myClosure:((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func somStringFunc(string:String) -> Void {
        
    }
    
    @IBAction func closurePassData(_ sender: Any) {
        
        myClosure?("Closure String")
        self.dismiss(animated: true, completion: nil)
    }
}
