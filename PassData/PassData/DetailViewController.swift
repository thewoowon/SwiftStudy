//
//  DetailViewController.swift
//  PassData
//
//  Created by woowon on 2022/01/25.
//

import UIKit

class DetailViewController: UIViewController {

    var someString: String = ""
    
    @IBOutlet weak var detailObj: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailObj.text = someString
        
        
    }
}
