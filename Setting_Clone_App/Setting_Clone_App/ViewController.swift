//
//  ViewController.swift
//  Setting_Clone_App
//
//  Created by woowon on 2022/01/27.
//

import UIKit

class ViewController: UIViewController {

    
    var settingModel = [[SettingModel]]()
    @IBOutlet weak var settingTableView: UITableView!
    
    func makeData(){
        settingModel.append(
        [SettingModel(leftImageName: "person.circle", menuTitle: "Sign in your iPhone", subTitle: "Set up iCloud, the App Store, and more.", rightImageName: "chevron.right")])
        
        settingModel.append(
        [SettingModel(leftImageName: "gear", menuTitle: "General", subTitle: nil, rightImageName: "chevron.right"),
         SettingModel(leftImageName: "figure.wave.circle", menuTitle: "Accessibility", subTitle: nil, rightImageName: "chevron.right"),
         SettingModel(leftImageName: "hand.raised.fill", menuTitle: "Privacy", subTitle: nil, rightImageName: "chevron.right")
        ])
        
        settingModel.append(
        [SettingModel(leftImageName: "key.fill", menuTitle: "Passwords", subTitle: nil, rightImageName: "chevron.right")
       ])
        
        
        settingModel.append(
        [SettingModel(leftImageName: "gear", menuTitle: "Safari", subTitle: nil, rightImageName: "chevron.right"),
         SettingModel(leftImageName: "figure.wave.circle", menuTitle: "News", subTitle: nil, rightImageName: "chevron.right"),
         SettingModel(leftImageName: "hand.raised.fill", menuTitle: "Translate", subTitle: nil, rightImageName: "chevron.right"),
         SettingModel(leftImageName: "gear", menuTitle: "Maps", subTitle: nil, rightImageName: "chevron.right"),
          SettingModel(leftImageName: "figure.wave.circle", menuTitle: "Shortcuts", subTitle: nil, rightImageName: "chevron.right"),
          SettingModel(leftImageName: "hand.raised.fill", menuTitle: "Health", subTitle: nil, rightImageName: "chevron.right"),
         SettingModel(leftImageName: "gear", menuTitle: "Siri & Search", subTitle: nil, rightImageName: "chevron.right"),
          SettingModel(leftImageName: "figure.wave.circle", menuTitle: "Photos", subTitle: nil, rightImageName: "chevron.right"),
          SettingModel(leftImageName: "hand.raised.fill", menuTitle: "Game Centers", subTitle: nil, rightImageName: "chevron.right")
        ])
        
        settingModel.append(
        [SettingModel(leftImageName: "gear", menuTitle: "Developer", subTitle: nil, rightImageName: "chevron.right")
        ])
        

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = .systemGray6
        let nib1 = UINib(nibName: "ProfileCell", bundle: nil)
        settingTableView.register(nib1, forCellReuseIdentifier: "ProfileCell")
        
        let nib2 = UINib(nibName: "SettingMenuCell", bundle: nil)
        settingTableView.register(nib2, forCellReuseIdentifier: "SettingMenuCell")
        
        let nib3 = UINib(nibName: "MenuCell", bundle: nil)
        settingTableView.register(nib3, forCellReuseIdentifier: "MenuCell")
        
        self.title = "Settings"
        self.view.backgroundColor = .systemGray6
        makeData()
    }
}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].count // 섹션별 내부 인덱스 구분
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count // 내부 이차원 배열의 개수
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 && indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            
            cell.profileImageView.image =  UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.bottomTitie.text = settingModel[indexPath.section][indexPath.row].subTitle
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell

        cell.rightImage.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)

        cell.centerImage.text = settingModel[indexPath.section][indexPath.row].menuTitle
        cell.leftImage.image = UIImage(systemName: (settingModel[indexPath.section][indexPath.row].rightImageName ?? ""))

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if(indexPath.section == 0 && indexPath.row == 0)
        {
            let myID = MyIDViewController(nibName: "MyIDViewController", bundle: nil)
            
            self.present(myID, animated: true, completion: nil)
            
            
            
        }
        else if(indexPath.section == 1 && indexPath.row == 0)
        {
            if let generalViewController = UIStoryboard(name: "GeneralViewController", bundle:nil).instantiateViewController(identifier:"GeneralViewController") as? GeneralViewController{
                self.navigationController?.pushViewController(generalViewController, animated: true)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0 && indexPath.row == 0)
        {
            return UITableView.automaticDimension
        }
        
        return 80
    }
}
