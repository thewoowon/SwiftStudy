//
//  ViewController.swift
//  PassData
//
//  Created by woowon on 2022/01/25.
//

// 데이터를 넘겨주는 방법 6가지
// 1. 대상 클래스의 인스턴스에 넘겨주는 것
// 2. 세그웨이 방식
// 3. Instance 방식 -> controller 객체 자체를 넘겨주는 것 -> 상호작용이 가능
// 4. 대리자 - Delegate
// 5. 클로저 - Closure
// 6. Notification - 알람

import UIKit

class ViewController: UIViewController {

    var someString = ""
    
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var dataLabel: UILabel!
    
    
    @IBAction func notiAction(_ sender: Any) {
        
        let detailVc = NotiDetailViewController(nibName: "NotiDetailViewController", bundle: nil)
        
        self.present(detailVc, animated: true, completion: nil)
    }
    
    
    @IBAction func passDisplay(_ sender: Any) {
        
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detailVC.someString = "넘겨받은 내용입니다.!!!"
        
        self.present(detailVC, animated: true, completion:nil) // 화면에 올릴 준비를 한 후 -> 즉 메모리에 올라간 후임
        
        detailVC.detailObj.text = "직접 주입"
        
        
    }
    
    @IBAction func moveToInstance(_ sender: Any) {
        let detailVc = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
        
        detailVc.mainVc = self
        
        self.present(detailVc, animated: true, completion: nil)
        
        
    }
    
    @IBAction func moveToPattern(_ sender: Any) {
        
        let detailVc = DelegateDetailViewController(nibName: "DelegateDetailViewController", bundle: nil)
        
        detailVc.delegate = self
        
        self.present(detailVc, animated: true, completion: nil)
        
    }
    
    @IBAction func moveToClosure(_ sender: Any) {
        
        let detailVc = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)
        
        detailVc.myClosure = { str in
            self.dataLabel.text = str
        }
        
        self.present(detailVc, animated: true, completion: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 화면 전화 버튼 이벤트
        
        if segue.identifier == "segwayDetail"{
            if let detailVC = segue.destination as? SegwayDetailViewController{
                detailVC.segwayData = "넘겨준 자료입니다."
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationName = Notification.Name("showSomeString")
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notificationName, object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        detailButton.backgroundColor = UIColor.orange
    }
    
    @objc func keyboardDidShow(){
        print("Did show")
    }
    
    @objc func keyboardWillShow(){
        print("will show")
    }
    
    @objc func showSomeString(notification:Notification)
    {
        if let str = notification.userInfo?["str"] as? String{
            self.dataLabel.text = str
        }
    }
}
extension ViewController:DelegateDetailViewControllerDelegate{
    func passString(string:String){
        self.dataLabel.text = string
    }
}

