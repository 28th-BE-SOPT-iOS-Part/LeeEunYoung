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
        
        self.makeRequestAlert(titlte: "알림", message: "로그인하시겠습니까?", okAction: {
            _ in self.loginAction()})
        
        if ID.text?.isEmpty==false && PW.text?.isEmpty==false{
        
        guard let nextVC1=self.storyboard?.instantiateViewController(identifier: "TabBar")as? UITabBarController else {return}
            nextVC1.modalPresentationStyle = .fullScreen
        //nextVC1.message=ID.text
        self.present(nextVC1, animated: true, completion: nil)
        }
        
        
    }

    @IBAction func create(_ sender: Any) {
        guard let nextVC2=self.storyboard?.instantiateViewController(identifier: "RegisterViewController")as? RegisterViewController else {return}
        
        
        self.navigationController?.pushViewController(nextVC2, animated: true)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

         self.view.endEditing(true)

   }
    func loginAction(){
        
        LoginService.shared.login(email: self.ID.text!, password: self.PW.text!){
            result in
            switch result
            {
            case .success(let message):
                if let message = message as? String{
                    self.makeAlert(title: "알림", message: message)
                    guard let next = self.storyboard?.instantiateViewController(identifier: "TabBar")as? UITabBarController else {return}
                    self.navigationController?.pushViewController(next, animated: true)
                }
                
            case .requestErr(let message):
                
                if let message = message as? String{
                    self.makeAlert(title: "알림", message: message)
                }
                
            default:
                print("Error")
            
            }
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
    extension UIViewController
    {
        func makeRequestAlert(titlte : String,
                              message: String,
                              okAction : ((UIAlertAction)->Void)?,
                              cancelAction : ((UIAlertAction)-> Void)? = nil,
                              completion: (() -> Void)? = nil)
        {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
            let alertViewController = UIAlertController(title: title, message: message,
                                                        preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
            alertViewController.addAction(okAction)
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: cancelAction)
            alertViewController.addAction(cancelAction)
            
            self.present(alertViewController, animated: true, completion: completion)
            
        }
        
        
        func makeAlert(title : String,
                       message: String,
                       okAction: ((UIAlertAction)-> Void)? = nil,
                       completion: (()->Void)? = nil)
        {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
            let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
            alertViewController.addAction(okAction)
            
            self.present(alertViewController, animated: true, completion: completion)
        }
        
    }


