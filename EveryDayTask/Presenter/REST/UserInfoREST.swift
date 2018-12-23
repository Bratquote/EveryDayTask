//
//  UserInfoREST.swift
//  EveryDayTask
//
//  Created by Timur Karimov on 12/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation

class UserInfoREST {
    static var baseUrl = "http://localhost:5000"
    static var apiUser = "/api/User"
    static var apiTask = "/api/Task"
    
    static func create(user: UserInfo) -> String {
        var request = baseUrl + apiUser
        
        
        request += "?name=\(user.name)&surname=\(user.surname)&email=\(user.email)&password=\(user.password)"
        print(request)
        return request
    }
    
    
    
}

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
