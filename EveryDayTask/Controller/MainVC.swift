//
//  MainVC.swift
//  EveryDayTask
//
//  Created by Timur Karimov on 02/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    var getRequests: GetRequests!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !UserDefaultsPresenter.getBool(withKey: UserDefaultsEnum.isLogin.rawValue) {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoginID") as! LoginVC
            self.present(newViewController, animated: true, completion: nil)
        }
        
        getRequests = GetRequests()
        var id = getRequests.userId(email: UserDefaultsPresenter.getString(withKey: UserDefaultsEnum.email.rawValue)!)
        if let currentId = id {
            if let user = getRequests.userInfo(userId: currentId) {
                print(user.name)
                UserDefaultsPresenter.setUser(user: user)
            }
            
            
            
        }
        // Do any additional setup after loading the view.
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
