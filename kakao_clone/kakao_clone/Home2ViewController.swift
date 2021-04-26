//
//  Home2ViewController.swift
//  kakao_clone
//
//  Created by 이은영 on 2021/04/23.
//

import UIKit

class Home2ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        swipeRecognizer()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ProfileClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func swipeRecognizer() {
            let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
            swipeDown.direction = UISwipeGestureRecognizer.Direction.down
            self.view.addGestureRecognizer(swipeDown)
            
        }
        
        @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
            if let swipeGesture = gesture as? UISwipeGestureRecognizer {
                switch swipeGesture.direction{
                case UISwipeGestureRecognizer.Direction.down:
                    // 스와이프 시, 원하는 기능 구현.
                    self.dismiss(animated: true, completion: nil)
                default: break
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
