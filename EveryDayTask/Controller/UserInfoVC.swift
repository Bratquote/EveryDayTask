//
//  UserInfoVC.swift
//  EveryDayTask
//
//  Created by Timur Karimov on 02/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {
    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareImage()
        userName.text = "\(ApplicationInfo.user!.name) \(ApplicationInfo.user!.surname)"
        userEmail.text = ApplicationInfo.user!.email
        // Do any additional setup after loading the view.
    }
    
    func prepareImage() {
        //userPhoto.layer.borderWidth = 1
        userPhoto.layer.masksToBounds = false
        userPhoto.layer.borderColor = UIColor.black.cgColor
        userPhoto.layer.cornerRadius = userPhoto.frame.height/2 //This will change with corners of image and height/2 will make this circle shape
        userPhoto.clipsToBounds = true
        userPhoto.image = UIImage(named: "Avatar")
    }
    
    @IBAction func friendsButton(_ sender: Any) {
        print("Tapped friendsButton")
    }
    
    @IBAction func completedTasksButton(_ sender: Any) {
        print("Tapped CompletedTasksButton")
    }
    
    
    @IBAction func logoutButton(_ sender: Any) {
        performSegue(withIdentifier: "Logout", sender: nil)
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
