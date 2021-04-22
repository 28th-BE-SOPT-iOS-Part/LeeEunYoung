//
//  Home1ViewController.swift
//  kakao_clone
//
//  Created by 이은영 on 2021/04/22.
//

import UIKit

class Home1ViewController: UIViewController {

    @IBOutlet weak var ProfileButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func back1(_sender:UIImageView){
        guard let nextVC=self.storyboard?.instantiateViewController(identifier: "Home2ViewController")as? Home2ViewController else {return}
        
        self.present(nextVC, animated: true, completion: nil)
        
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
