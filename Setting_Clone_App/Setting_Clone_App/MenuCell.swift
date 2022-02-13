//
//  MenuCell.swift
//  Setting_Clone_App
//
//  Created by woowon on 2022/01/28.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var centerImage: UILabel!
    @IBOutlet weak var leftImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
