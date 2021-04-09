//
//  CheckViewController.swift
//  Sopt28th_FirstSeminar_hw
//
//  Created by 이은영 on 2021/04/08.
//

import UIKit

class CheckViewController: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    var message : String?
    
    @IBOutlet weak var Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Button.backgroundColor=UIColor.yellow
          
        setLabel()


        // Do any additional setup after loading the view.
    }
    
    func setLabel()
       {
           if let msg=self.message
           {
               Label.text="\(msg)님 \n환영합니다"
           }
       }
    
   
    @IBAction func Button(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
