//
//  NSUserDefaultsPresenter.swift
//  EveryDayTask
//
//  Created by Timur Karimov on 06/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation


class UserDefaultsPresenter {
    static func setObject(value: AnyObject!, forKey defaultName: String!) {
        let defaults:UserDefaults = UserDefaults.standard
        defaults.set(value, forKey:defaultName)
        defaults.synchronize()
    }
   
    static func setString(value: String!, forKey defaultName: String!) {
        let defaults:UserDefaults = UserDefaults.standard
        defaults.set(value, forKey:defaultName)
        defaults.synchronize()
    }
    
    static func setInt(value: Int!, forKey defaultName: String!) {
        let defaults:UserDefaults = UserDefaults.standard
        defaults.set(value, forKey:defaultName)
        defaults.synchronize()
    }
    
    static func setBool(value: Bool!, forKey defaultName: String!) {
        let defaults:UserDefaults = UserDefaults.standard
        defaults.set(value, forKey:defaultName)
        defaults.synchronize()
    }
    
    static func getObject(defaultName: String!) -> AnyObject! {
        let defaults:UserDefaults = UserDefaults.standard
        return defaults.object(forKey: defaultName) as AnyObject
    }
    
    static func getString(withKey defaultName: String!) -> String? {
        let defaults:UserDefaults = UserDefaults.standard
        if let result = defaults.object(forKey: defaultName) as? String {
            return result
        }
        return nil
    }
    
    static func getInt(withKey defaultName: String!) -> Int? {
        let defaults:UserDefaults = UserDefaults.standard
        if let result = defaults.object(forKey: defaultName) as? Int {
            return result
        }
        return nil
    }
    
    static func getBool(withKey defaultName: String!) -> Bool {
        let defaults:UserDefaults = UserDefaults.standard
        if let result = defaults.object(forKey: defaultName) as? Bool {
            return result
        }
        return false
    }
    
    static func setUser(user: UserInfo) {
        setString(value: user.name, forKey: UserDefaultsEnum.name.rawValue)
        setString(value: user.surname, forKey: UserDefaultsEnum.surname.rawValue)
        setString(value: user.email, forKey: UserDefaultsEnum.email.rawValue)
        setString(value: user.password, forKey: UserDefaultsEnum.password.rawValue)
       
    }
    
    
   
}
