//
//  LoginViewController.swift
//  kakao_clone
//
//  Created by 이은영 on 2021/04/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var ID: UITextField!
    @IBOutlet weak var Text: UILabel!
    
    @IBOutlet weak var PW: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var CreateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginButton.backgroundColor=UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 0.5)
        CreateButton.backgroundColor=UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 0.5)
        Text.text="사용하던 카카오계정이 있다면 \n이메일또는 전화번호로 로그인해 주세요"
    
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Login(_ sender: Any) {
        guard let nextVC1=self.storyboard?.instantiateViewController(identifier: "CheckViewController")as? CheckViewController else {return}
        
        self.present(nextVC1, animated: true, completion: nil)
        
    }
    @IBAction func create(_ sender: Any) {
        guard let nextVC2=self.storyboard?.instantiateViewController(identifier: "RegisterViewController")as? RegisterViewController else {return}
        
        self.navigationController?.pushViewController(nextVC2, animated: true)
        
        
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
