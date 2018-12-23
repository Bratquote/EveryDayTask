//
//  GetRequests.swift
//  EveryDayTask
//
//  Created by Timur Karimov on 13/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation


class GetRequests {
    
    func getData(urlJSON: String) -> Data? {
        if let url = URL(string: urlJSON) {
            if let data = try? Data(contentsOf: url) {
                return data
            }
        }
        print("Return nil")
        return nil
    }
    
    
//    func parse(data: Data) {
//
//        let decoder = JSONDecoder()
//
//        if let jsonEvents = try? decoder.decode([Event].self, from: data) {
//            eventArray = jsonEvents
//
//            core.addEvents(eventArray: eventArray)
//
//        }
//    }
    
    func userInfo(userId: Int) -> UserInfo? {
        var user: UserInfo
        var url: String = UserInfoREST.baseUrl + UserInfoREST.apiUser + "?id=\(userId)"
        
        if let data = getData(urlJSON: url) {
            let decoder = JSONDecoder()
            
            if let jsonUser = try? decoder.decode(UserInfo.self, from: data){
                user = jsonUser
                return user
            }
            
        }
        return nil
        
    }
    
    func userId(email: String) -> Int? {
        var id: Id
        var url: String = UserInfoREST.baseUrl + UserInfoREST.apiUser + "/" + email
        print(url)
        if let data = getData(urlJSON: url) {
            let decoder = JSONDecoder()
            //print(data)
            if let jsonId = try? decoder.decode(Id.self, from: data){
                id = jsonId
                print(id.id)
                return id.id
            }
            
        }
        return -2
    }
    
    func userFriends() {
        
    }
    
    func userTasks() {
        
    }
    
    
}
