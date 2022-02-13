//
//  GeneralViewController.swift
//  Setting_Clone_App
//
//  Created by woowon on 2022/01/28.
//

import UIKit

class GeneralViewController: UIViewController{
    
    
    var generalModel = [[GeneralModel]]()
    
    @IBOutlet weak var generalTableView: UITableView!
    
    func makeData(){
        generalModel.append(
        [GeneralModel(leftLabel: "About", rightImageName: "chevron.right")])
        
        generalModel.append(
        [GeneralModel(leftLabel: "Keyboard", rightImageName: "chevron.right")
        ,GeneralModel(leftLabel: "Game Controller", rightImageName: "chevron.right")
        ,GeneralModel(leftLabel: "Fonts", rightImageName: "chevron.right")
        ,GeneralModel(leftLabel: "Language & Region", rightImageName: "chevron.right")
        ,GeneralModel(leftLabel: "Dictionary", rightImageName: "chevron.right")])
        
        generalModel.append(
            [GeneralModel(leftLabel: "Transfer or Reset iPhone", rightImageName: "chevron.right")])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generalTableView.dataSource = self
        generalTableView.delegate = self
        
        self.title = "General"
        
        generalTableView.backgroundColor = .systemGray6
        
        let nib1 = UINib(nibName: "GeneralCell", bundle: nil)
        generalTableView.register(nib1, forCellReuseIdentifier: "GeneralCell")
        
        
        makeData()
    }
}


extension GeneralViewController : UITableViewDataSource,UITableViewDelegate{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generalModel[section].count // 섹션별 내부 인덱스 구분
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return generalModel.count // 내부 이차원 배열의 개수
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as! GeneralCell

        cell.leftLabel.text = generalModel[indexPath.section][indexPath.row].leftLabel
        cell.rightImage.image = UIImage(systemName: (generalModel[indexPath.section][indexPath.row].rightImageName ?? ""))

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
