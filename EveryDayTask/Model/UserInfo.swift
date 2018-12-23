//
//  UserInfo.swift
//  EveryDayTask
//
//  Created by Timur Karimov on 02/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation


struct UserInfo: Codable {
    var name: String
    var surname: String
    var email: String
    var phoneNumber: String?
    var password: String //only for test, later must me removed
    
    
//    func registration(name: String, surname: String, email: String, password: String) -> UserInfo {
//        var user: UserInfo = UserInfo(name: <#String#>, surname: <#String#>, email: <#String#>)
//    user.name = name
//    user.surname = surname
//    user.email = email
//    user.password = password
//    }
}
