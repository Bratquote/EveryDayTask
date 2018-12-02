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

