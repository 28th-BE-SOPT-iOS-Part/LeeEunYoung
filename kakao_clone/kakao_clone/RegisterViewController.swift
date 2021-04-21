//
//  RegisterViewController.swift
//  kakao_clone
//
//  Created by 이은영 on 2021/04/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var CreateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        CreateButton.backgroundColor=UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 0.5)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Create(_ sender: Any) {
        guard let nextVC3=self.storyboard?.instantiateViewController(identifier: "CheckViewController")as? CheckViewController else {return}
        
        self.present(nextVC3, animated: true, completion: nil)
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
