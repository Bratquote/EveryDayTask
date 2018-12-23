//
//  LoginVC.swift
//  EveryDayTask
//
//  Created by Timur Karimov on 02/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var postRequests: PostRequests!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(postRequests.getResponse())
        //if UserDefaultsPresenter.getBool(withKey: UserDefaultsEnum.isLogin.rawValue) ?? false{
            print(UserDefaultsPresenter.getBool(withKey: UserDefaultsEnum.isLogin.rawValue) ?? false)
        
        //}
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        if emailTextField.text?.lowercased() == UserDefaultsPresenter.getString(withKey: UserDefaultsEnum.email.rawValue) &&
            passwordTextField.text == UserDefaultsPresenter.getString(withKey: UserDefaultsEnum.password.rawValue) {
            performSegue(withIdentifier: "Login", sender: nil)
        } else {
            let ac = UIAlertController(title: "Error", message: "Your e-mail or password are incorrect", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(ac,animated: true)
        }
        
    }
    
    @IBAction func registrationButton(_ sender: Any) {
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
