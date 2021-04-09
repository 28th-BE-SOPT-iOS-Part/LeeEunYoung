//
//  RegisterViewController.swift
//  Sopt28th_FirstSeminar_hw
//
//  Created by 이은영 on 2021/04/08.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var Label1: UILabel!
    
    @IBOutlet weak var TextField1: UITextField!
    @IBOutlet weak var TextField2: UITextField!
    @IBOutlet weak var TextField3: UITextField!
    
    @IBOutlet weak var Button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label1.text="카카오톡을 시작합니다"
        Button1.backgroundColor=UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 0.5)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CheckButton(_ sender: Any) {
    
        if TextField1.text?.isEmpty == false && TextField2.text?.isEmpty == false && TextField3.text?.isEmpty == false {
            guard let nextVC=self.storyboard?.instantiateViewController(identifier: "CheckViewController")as? CheckViewController else {return}
        nextVC.message=TextField1.text
        self.present(nextVC, animated: true, completion: nil)
        }
    
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   } //화면 클릭하면 키보드 내리기

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
