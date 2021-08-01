//
//  TabBarViewController.swift
//  kakao_clone
//
//  Created by 이은영 on 2021/04/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
    }

    func setStyle(){
        self.tabBar.tintColor=UIColor.black
        self.tabBar.unselectedItemTintColor=UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 0.5)
    }

}
