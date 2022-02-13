//
//  MyIDViewController.swift
//  Setting_Clone_App
//
//  Created by woowon on 2022/01/28.
//

import UIKit

class MyIDViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func cancelAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.addTarget(self, action: #selector(textFiedDidChange), for: .editingChanged)
        
        textFiedDidChange(sender: emailTextField)
    }
    
    @objc func textFiedDidChange(sender : UITextField){
        if sender.text?.isEmpty == true{
            nextButton.isEnabled = false
        }
        else
        {
            nextButton.isEnabled = true
        }
    }
}
