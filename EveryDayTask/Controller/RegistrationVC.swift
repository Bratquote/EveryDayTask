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
    
    var activeField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        surnameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        password2TextField.delegate = self
        
        self.hideKeyboardTappedAround()
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isTextFieldsAreCorrect() -> Bool {
        var result = false
        if nameTextField.text != "" &&
            surnameTextField.text != "" &&
            passwordTextField.text != "" &&
            passwordTextField.text == password2TextField.text &&
            isValidEmail(testStr: emailTextField.text!) {
            result = true
        }
        return result
    }
    
    @IBAction func toRegisterButton(_ sender: Any) {
        if isTextFieldsAreCorrect() {
            toRegisterButtonOutlet.titleLabel?.text = "Good"
            ApplicationInfo.user = UserInfo(
                name: nameTextField.text!,
                surname: surnameTextField.text!,
                email: emailTextField.text!,
                phoneNumber: nil,
                avatar: nil,
                password: passwordTextField.text!)
            
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

