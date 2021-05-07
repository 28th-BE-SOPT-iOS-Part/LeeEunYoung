//
//  SettingCollectionViewCell.swift
//  kakao_clone
//
//  Created by 이은영 on 2021/05/01.
//

import UIKit

class SettingCollectionViewCell: UICollectionViewCell {
    
    static let identifier : String = "SettingCollectionViewCell"
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setData(imageName : String,title : String){
        if let image = UIImage(named: imageName){
            ImageView.image=image
        }
        titleLabel.text=title
    }
}
