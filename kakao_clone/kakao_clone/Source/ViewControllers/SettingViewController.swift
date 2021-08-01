//
//  SettingViewController.swift
//  kakao_clone
//
//  Created by 이은영 on 2021/05/01.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var SettingCollectionView: UICollectionView!
    private var iconList : [IconDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setCollectionView()
        setIconList()
    }
    
    func setCollectionView(){
        SettingCollectionView.delegate=self
        SettingCollectionView.dataSource=self
    }
    
    func setIconList()
    {
        iconList.append(contentsOf: [
            IconDataModel(name: "messageTabIcon", title: "메일"),
            IconDataModel(name: "messageTabIcon", title: "캘린더"),
            IconDataModel(name: "messageTabIcon", title: "서랍"),
            IconDataModel(name: "messageTabIcon", title: "카카오콘"),
            IconDataModel(name: "messageTabIcon", title: "메이커스"),
            IconDataModel(name: "messageTabIcon", title: "선물하기"),
            IconDataModel(name: "messageTabIcon", title: "이모티콘"),
            IconDataModel(name: "messageTabIcon", title: "프렌즈"),
            IconDataModel(name: "messageTabIcon", title: "쇼핑하기"),
            IconDataModel(name: "messageTabIcon", title: "스타일"),
            IconDataModel(name: "messageTabIcon", title: "주문하기"),
            IconDataModel(name: "messageTabIcon", title: "멜론티켓"),
            IconDataModel(name: "messageTabIcon", title: "게임"),
            IconDataModel(name: "messageTabIcon", title: "멜론"),
            IconDataModel(name: "messageTabIcon", title: "헤어샵"),
            IconDataModel(name: "messageTabIcon", title: "전체 서비스")
        ])
    }

}

extension SettingViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let iconCell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingCollectionViewCell.identifier, for: indexPath)as? SettingCollectionViewCell else {return UICollectionViewCell()}
        iconCell.setData(imageName: iconList[indexPath.row].name, title: iconList[indexPath.row].title)
        
        return iconCell
    }
}
extension SettingViewController : UICollectionViewDelegate
{
    
    
}
extension SettingViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width*(70/414)
        let cellHeight = cellWidth*(70/70)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 19
    }
}
