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
        
        self.tabBar.tintColor=UIColor.black
        self.tabBar.unselectedItemTintColor=UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 0.5)
    

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
