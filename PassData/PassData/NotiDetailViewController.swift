//
//  NotiDetailViewController.swift
//  PassData
//
//  Created by woowon on 2022/01/26.
//

import UIKit

class NotiDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func notiAction(_ sender: Any) {
        
        
        let notificationName = Notification.Name("showSomeString")
        
        let strDic = ["str" : "Noti String"]
        
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: strDic)
        
    }
}
