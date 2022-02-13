//
//  SettingMenuCell.swift
//  Setting_Clone_App
//
//  Created by woowon on 2022/01/27.
//

import UIKit

class SettingMenuCell: UITableViewCell {

//    @IBOutlet weak var LeftImg: UIImageView!
//    @IBOutlet weak var RightImg: UIImageView!
//    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var rightImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //LeftImg.layer.backgroundColor =
        //RightImg.layer.backgroundColor =
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
