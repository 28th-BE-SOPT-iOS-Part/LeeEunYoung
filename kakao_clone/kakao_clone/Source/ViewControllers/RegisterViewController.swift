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
            
        guard let nextVC3=self.storyboard?.instantiateViewController(identifier: "TabBar")as? UITabBarController else {return}
            nextVC3.modalPresentationStyle = .fullScreen
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

extension UIViewController
{
    func makeRequestAlert(title : String,
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
    
    
    func makeAlert2(title : String,
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


