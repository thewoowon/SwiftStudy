//
//  ViewController.swift
//  OnBoardingView
//
//  Created by woowon on 2022/01/31.
//

import UIKit

class ViewController: UIViewController {

    var didShowOnBoardingView = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //메모리에 올라온 시점
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 화면에 송출할 예정인 시점 -> 아직 화면에 올라오지 않은 상태
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //화면에 송출되고 난 상태
        let pageVc = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
        
        pageVc.modalPresentationStyle = .fullScreen
        
        self.present(pageVc, animated: true, completion: nil)
    }
}

