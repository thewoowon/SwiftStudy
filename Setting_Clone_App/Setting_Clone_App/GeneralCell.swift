//
//  GeneralCell.swift
//  Setting_Clone_App
//
//  Created by woowon on 2022/01/28.
//

import UIKit

class GeneralCell: UITableViewCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
