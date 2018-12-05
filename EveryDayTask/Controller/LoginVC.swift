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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ApplicationInfo.user?.name = "Timur"
        ApplicationInfo.user?.surname = "Karimov"
        ApplicationInfo.user?.email = "bratquote@gmail.com"
        ApplicationInfo.user?.password = "Newkek"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if emailTextField.text == ApplicationInfo.user?.email &&
            passwordTextField.text == ApplicationInfo.user?.password {
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
