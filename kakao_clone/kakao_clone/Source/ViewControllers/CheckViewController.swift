//
//  CheckViewController.swift
//  kakao_clone
//
//  Created by 이은영 on 2021/04/21.
//

import UIKit

class CheckViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    var message : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLabel()
    }
    

    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setLabel()
    {
        if let msg=self.message
        {
            messageLabel.text="\(msg)님 \n환영합니다."
        }
    }
    
    func setStyle(){
        button.backgroundColor=UIColor.yellow
    }

}
