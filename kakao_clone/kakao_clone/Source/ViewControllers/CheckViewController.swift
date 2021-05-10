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
        button.backgroundColor=UIColor.yellow
        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
