//
//  ViewController.swift
//  DispatchQueue
//
//  Created by woowon on 2022/01/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var finishLabe: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.timerLabel.text = Date().timeIntervalSince1970.description
        }
    }
    
    @IBAction func action1(_ sender: Any) {
        
        simpleClosure {
            self.finishLabe.text = "End!!"
        }
    }
    
    func simpleClosure(completion: @escaping ()-> Void){
        
        DispatchQueue.global().async {
            for index in 0 ..< 10 // 멀티 쓰레드로
            {
                Thread.sleep(forTimeInterval: 0.3) // 메인 쓰레드에서 실행되는 로직들
                print(index)
            }
            
            DispatchQueue.main.async { // 화면에 대한 갱신은 메인 쓰레드에서만
                completion()
            }
        }
    }
    
    @IBAction func action2(_ sender: Any) {
        
        let dispatchGroup = DispatchGroup()
        
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        let queue3 = DispatchQueue(label: "q3")
        
        queue1.async(group: dispatchGroup){
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 0 ..< 10 // 멀티 쓰레드로
                {
                    Thread.sleep(forTimeInterval: 0.3) // 메인 쓰레드에서 실행되는 로직들
                    print(index)
                }
                dispatchGroup.leave()
            }
        }
        queue2.async(group: dispatchGroup){
            dispatchGroup.enter()
            for index in 10 ..< 20 // 멀티 쓰레드로
            {
                Thread.sleep(forTimeInterval: 0.3) // 메인 쓰레드에서 실행되는 로직들
                print(index)
            }
            dispatchGroup.leave()
        }
        queue3.async(group: dispatchGroup){
            dispatchGroup.enter()
            for index in 20 ..< 30 // 멀티 쓰레드로
            {
                Thread.sleep(forTimeInterval: 0.3) // 메인 쓰레드에서 실행되는 로직들
                print(index)
            }
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: DispatchQueue.main){
            print("End!!!!!!")
        }
    }
    
    @IBAction func action3(_ sender: Any) {
        let dispatchGroup = DispatchGroup()
        
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        
        
        
//        DispatchQueue.main.sync {
//            print("데드락")
//        }
        
//        queue1.async{
//            for index in 0 ..< 10 // 멀티 쓰레드로
//            {
//                Thread.sleep(forTimeInterval: 0.3) // 메인 쓰레드에서 실행되는 로직들
//                print(index)
//            }
//
//            //교착상태 -> DeadLock -> 아무것도 못하고 있는 상태, 서로가 서로를 기다리는 상태
//            queue1.sync {
//                for index in 0 ..< 10 // 멀티 쓰레드로
//                {
//                    Thread.sleep(forTimeInterval: 0.3) // 메인 쓰레드에서 실행되는 로직들
//                    print(index)
//                }
//            }
//        }
        
        
        queue1.async(group: dispatchGroup, qos: .background){
            for index in 0 ..< 10 // 멀티 쓰레드로
            {
                Thread.sleep(forTimeInterval: 0.3) // 메인 쓰레드에서 실행되는 로직들
                print(index)
            }
        }
        queue2.async(group: dispatchGroup, qos: .userInteractive){
            for index in 10 ..< 20 // 멀티 쓰레드로
            {
                Thread.sleep(forTimeInterval: 0.3) // 메인 쓰레드에서 실행되는 로직들
                print(index)
            }
        }
        
        dispatchGroup.notify(queue: DispatchQueue.main){
            print("End!!!!!!")
        }
        
    }
    
    
}

