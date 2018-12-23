//
//  RegistrationVC.swift
//  EveryDayTask
//
//  Created by Timur Karimov on 02/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    
    @IBOutlet weak var toRegisterButtonOutlet: UIButton!
    
    @IBOutlet weak var constraintContentHeight: NSLayoutConstraint!
    
    var postRequests: PostRequests!
    var activeField: UITextField?
    var usrDef: UserDefaultsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postRequests = PostRequests()
        usrDef = UserDefaultsPresenter()
        
        setDelegates()
        self.hideKeyboardTappedAround()
        
    }
    
    
    func setDelegates() {
        nameTextField.delegate = self
        surnameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        password2TextField.delegate = self
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    func isTextFieldsAreCorrect() -> Bool {
        var result = false
        if nameTextField.text != "" &&
            surnameTextField.text != "" &&
            passwordTextField.text != "" &&
            passwordTextField.text == password2TextField.text &&
            TextFieldPresenter.isValidEmail(testStr: emailTextField.text!) {
            result = true
        }
        return result
    }
    
    
    func setUpUserDefaults() {
        UserDefaultsPresenter.setString(value: nameTextField.text, forKey: UserDefaultsEnum.name.rawValue)
        UserDefaultsPresenter.setString(value: surnameTextField.text, forKey: UserDefaultsEnum.surname.rawValue)
        UserDefaultsPresenter.setString(value: emailTextField.text?.lowercased(), forKey: UserDefaultsEnum.email.rawValue)
        UserDefaultsPresenter.setString(value: passwordTextField.text, forKey: UserDefaultsEnum.password.rawValue)
        UserDefaultsPresenter.setBool(value: true, forKey: UserDefaultsEnum.isLogin.rawValue)
    }
    @IBAction func toRegisterButton(_ sender: Any) {
        if isTextFieldsAreCorrect() {
            toRegisterButtonOutlet.titleLabel?.text = "Good"
            var newUser = UserInfo(
                name: nameTextField.text!,
                surname: surnameTextField.text!,
                email: emailTextField.text!,
                phoneNumber: nil,
                password: passwordTextField.text!)
            
            ApplicationInfo.user = newUser
            postRequests.createUser(user: newUser)
            //postRequests.create(url: UserInfoREST.create(user: newUser ))
            setUpUserDefaults()
            
            let ac = UIAlertController(title: "Registration complete!", message: "Now lets login in our service", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Go", style: .default, handler: backToLogin))
            present(ac, animated: true)
            
        } else {
            toRegisterButtonOutlet.titleLabel?.text = "Bad"
            
        }
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        performSegue(withIdentifier: "BackToLogin", sender: nil)
    }
    
    func backToLogin(action: UIAlertAction!) {
        performSegue(withIdentifier: "BackToLogin", sender: nil)
    }
    
    
}


extension UIViewController {
    func hideKeyboardTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        
    }
}

