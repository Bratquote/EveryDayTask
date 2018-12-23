//
//  PostRequests.swift
//  EveryDayTask
//
//  Created by Timur Karimov on 12/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation
import Alamofire

class PostRequests {
    var responseId: Int?
    
     func create(url: String) {
        Alamofire.request(url,method: .post).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                print(response.result.value!)
                if let res: Int = response.result.value! as! Int {
                    self.responseId = res
                    print(self.responseId)
                }
                //self.response = response.result.value as! String
                break
            case .failure(let error):
                
                print(error)
            }
        }
    }
    
    
    func createUser(user: UserInfo) {
        let baseUrl = UserInfoREST.baseUrl + UserInfoREST.apiUser
        let params: Parameters
        if let number = user.phoneNumber{
            params = ["name":user.name,"surname":user.surname,"email":user.email,"password":user.password,"phoneNumber":number]
        }
        else {
            params = ["name":user.name,"surname":user.surname,"email":user.email,"password":user.password]
        }
       
        Alamofire.request(baseUrl, method: .post, parameters: params).responseJSON{
            response in
            print(response)
        }
    }
    
    func createTask(task: TaskInfo) {
        let baseUrl = UserInfoREST.baseUrl + UserInfoREST.apiTask
        let params: Parameters = ["name":task.name,"userId":task.userId,"dateString":task.dateCreated,"daysGoal":task.daysGoal,"difficult":task.difficult, "description":task.description]
       
        Alamofire.request(baseUrl, method: .post, parameters: params).responseJSON{
            response in
            print(response)
        }
    }
    
    func getResponse() -> Int {
        if let res = responseId {
            return res
        }
        return -1
    }
}


