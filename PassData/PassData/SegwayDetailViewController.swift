//
//  SegwayDetailViewController.swift
//  PassData
//
//  Created by woowon on 2022/01/25.
//

import UIKit

class SegwayDetailViewController: UIViewController {

    
    var segwayData:String = ""
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLabel.text = segwayData
        
    }
}
