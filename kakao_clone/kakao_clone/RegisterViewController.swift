//
//  RegisterViewController.swift
//  kakao_clone
//
//  Created by 이은영 on 2021/04/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var ID: UITextField!
    @IBOutlet weak var CreateButton: UIButton!
    @IBOutlet weak var PW: UITextField!
    @IBOutlet weak var PWCheck: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CreateButton.backgroundColor=UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 0.5)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Create(_ sender: Any) {
        if ID.text?.isEmpty==false && PW.text?.isEmpty==false && PWCheck.text?.isEmpty==false{
            
        guard let nextVC3=self.storyboard?.instantiateViewController(identifier: "Home1ViewController")as? UITabBarController else {return}
        
        //nextVC3.message=ID.text
            
        self.present(nextVC3, animated: true, completion: nil)
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

         self.view.endEditing(true)

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
