//
//  Home1TableViewCell.swift
//  kakao_clone
//
//  Created by 이은영 on 2021/05/01.
//

import UIKit

class Home1TableViewCell: UITableViewCell {

    static let identifier : String = "Home1TableViewCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setData(imageName : String, title : String,subtitle : String){
        if let image = UIImage(named: imageName){
            iconImageView.image = image
        }
        titleLabel.text=title
        subtitleLabel.text = subtitle
    }
}
