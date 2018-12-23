//
//  TestVC.swift
//  EveryDayTask
//
//  Created by Timur Karimov on 13/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import UIKit

class TestVC: UIViewController {
    var postRequests: PostRequests!
    var getRequests: GetRequests!
    override func viewDidLoad() {
        super.viewDidLoad()
        getRequests = GetRequests()
        postRequests = PostRequests()
        //createTask()
        createUser()
        //getUSer()
        //postRequests.create(url: UserInfoREST.create(user: newUser ))
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func getUSer() {
        print(getRequests.userInfo(userId: 18))
    }
    func createUser() {
        let newUser = UserInfo(
            name: "Qwerty",
            surname: "Lol",
            email: "saslqweqwewrp@kozel.ru",
            phoneNumber: "+79127500610",
            password: "pediifgregergeik")
        postRequests.createUser(user: newUser)
    }

    
    func createTask() {
        let newTask = TaskInfo(
            name: "Create task",
            description: "Create task to build my app",
            friendId: "123",
            difficult: "hard",
            userId: 11,
            dateCreated: "13/12/2018",
            daysGoal: 12
        )
        postRequests.createTask(task: newTask)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
