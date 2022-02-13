//
//  ProfileCell.swift
//  Setting_Clone_App
//
//  Created by woowon on 2022/01/27.
//

import UIKit

class ProfileCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var bottomTitie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let profileHeight = 60
        profileImageView.layer.cornerRadius = CGFloat( profileHeight / 2)
        
        self.backgroundColor = .white
        self.layer.borderWidth = .zero
        
        topTitle.textColor = .blue
        topTitle.font = UIFont.systemFont(ofSize: 20)
        
        bottomTitie.textColor = .darkGray
        bottomTitie.font = UIFont.systemFont(ofSize: 16)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
