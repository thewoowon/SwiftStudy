//
//  OnBoardingViewController.swift
//  OnBoardingView
//
//  Created by woowon on 2022/01/31.
//

import UIKit

class OnBoardingViewController: UIViewController {

    var descriptionText = ""
    var mainText = ""
    var topimage :UIImage? = UIImage()
    
    @IBOutlet private weak var topImageView: UIImageView!
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    {
        didSet{
            descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        }
    }
    @IBOutlet private weak var mainTitleLabel: UILabel!
    {
        didSet{
            mainTitleLabel.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = descriptionText
        mainTitleLabel.text = mainText
        topImageView.image = topimage
        
    }
    
    
}
