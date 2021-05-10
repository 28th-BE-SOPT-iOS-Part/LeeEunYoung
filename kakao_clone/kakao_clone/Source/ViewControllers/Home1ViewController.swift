//
//  Home1ViewController.swift
//  kakao_clone
//
//  Created by 이은영 on 2021/04/22.
//

import UIKit

class Home1ViewController: UIViewController {
    
    @IBAction func alertAction(_ sender: Any) {
        showAlert(style: .actionSheet)
    }
    
    func showAlert(style:UIAlertController.Style){
        let alert=UIAlertController(title: nil, message: nil, preferredStyle: style)
        
        let setting1=UIAlertAction(title: "편집", style: .default, handler: nil)
        let setting2=UIAlertAction(title: "친구관리", style: .default, handler: nil)
        let setting3=UIAlertAction(title: "전체설정", style: .default, handler: nil)
        let setting4=UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(setting1)
        alert.addAction(setting2)
        alert.addAction(setting3)
        alert.addAction(setting4)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    static let identifier : String = "Home1ViewController"

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var Home1TableView: UITableView!
    
    private var friendList : [FriendDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFriendList()
        
        Home1TableView.delegate=self
        Home1TableView.dataSource=self
        Home1TableView.separatorStyle = .none
         // Do any additional setup after loading the view.
    }
    

    @IBAction func ProfileButton(_ sender: Any) {
        guard let ProfileVC=self.storyboard?.instantiateViewController(identifier: "Home2ViewController")as? Home2ViewController else {return}
        ProfileVC.modalPresentationStyle = .fullScreen
        self.present(ProfileVC, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func setFriendList()
        {
            friendList.append(contentsOf: [
                FriendDataModel(imageName: "profileImage1",
                                name: "안솝트",
                                state: "배고파요"),
                
                FriendDataModel(imageName: "profileImage2",
                                name: "최솝트",
                                state: "피곤해요"),
                
                FriendDataModel(imageName: "profileImage3",
                                name: "정솝트",
                                state: "시험언제끝나죠?"),
                
                FriendDataModel(imageName: "profileImage4",
                                name: "이솝트",
                                state: "ㅠㅠㅠㅠ"),
                
                FriendDataModel(imageName: "profileImage5",
                                name: "유솝트",
                                state: "나는 상태메세지!"),
                
                FriendDataModel(imageName: "profileImage6",
                                name: "박솝트",
                                state: "원하는대로 바꿔보세요 ^_^"),
                
                FriendDataModel(imageName: "profileImage7",
                                name: "최솝트",
                                state: "넘 덥다.."),
                
                FriendDataModel(imageName: "profileImage8",
                                name: "원솝트",
                                state: "배고파요"),
                
                FriendDataModel(imageName: "profileImage9",
                                name: "투솝트",
                                state: "내꿈은 대나무부자"),
                
                FriendDataModel(imageName: "profileImage10",
                                name: "권솝트",
                                state: "걱정말라구!")
                
            ])
        }
}


extension Home1ViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell=self.storyboard?.instantiateViewController(identifier: "Home2ViewController")as? Home2ViewController else {return}
        
        cell.name=self.friendList[indexPath.row].name
        cell.image=self.friendList[indexPath.row].imageName
        cell.state=self.friendList[indexPath.row].state
   
        cell.modalPresentationStyle = .fullScreen
        
        self.present(cell, animated: true, completion: nil)
    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 80))
        
        return headerView
    }
    
   
}

extension Home1ViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let serviceCell = tableView.dequeueReusableCell(withIdentifier: Home1TableViewCell.identifier, for: indexPath)
                as? Home1TableViewCell else {return UITableViewCell()}
        
        serviceCell.setData(imageName: friendList[indexPath.row].imageName, title: friendList[indexPath.row].name, subtitle: friendList[indexPath.row].state)
        
        return serviceCell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action1 = UIContextualAction(style: .normal, title: "차단", handler: {action,view,completionHalder in completionHalder(true)})
        action1.backgroundColor = .systemRed
        
        let action2 = UIContextualAction(style: .normal, title: "숨김", handler: {action,view,completionHalder in completionHalder(true)})
        action2.backgroundColor = .systemGray
        
        
        return UISwipeActionsConfiguration(actions: [action1,action2])
        }
    
}
