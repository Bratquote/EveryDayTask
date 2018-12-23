//
//  textFieldPresenter.swift
//  EveryDayTask
//
//  Created by Timur Karimov on 06/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation

class TextFieldPresenter {
    
    
    static func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    
}
