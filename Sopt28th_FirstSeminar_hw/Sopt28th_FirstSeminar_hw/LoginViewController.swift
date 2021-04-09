//
//  LoginViewController.swift
//  Sopt28th_FirstSeminar_hw
//
//  Created by 이은영 on 2021/04/08.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    
    @IBOutlet weak var TextField1: UITextField!
    @IBOutlet weak var TextField2: UITextField!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Label1.text="카카오톡을 시작합니다"
        Label2.text="사용하던 카카오계정이 있다면 \n이메일 또는 전화번호로 로그인해 주세요"
        
        Button1.backgroundColor=UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 0.5)
        Button2.backgroundColor=UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 0.5)
        Label2.textColor=UIColor.init(red: 115/255, green: 115/255, blue: 115/255, alpha: 0.5)
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   } //화면 클릭하면 키보드 내리기
    
    @IBAction func LoginButton(_ sender: Any) {
        
        if TextField1.text?.isEmpty == false && TextField2.text?.isEmpty == false{
        guard let nextVC1=self.storyboard?.instantiateViewController(identifier: "CheckViewController")as? CheckViewController else{ return }

           nextVC1.message=TextField1.text
           self.present(nextVC1, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func CreateButton(_ sender: Any) {
        guard let nextVC2=self.storyboard?.instantiateViewController(identifier: "RegisterViewController")as? RegisterViewController else{ return }
        
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
