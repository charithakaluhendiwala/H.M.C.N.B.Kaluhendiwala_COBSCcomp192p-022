//
//  SessionManager.swift
//  H.M.C.N.B.Kaluhendiwala_COBSCcomp192p-022
//
//  Created by char1 on 4/25/21.
//  Copyright © 2021 char1. All rights reserved.
//

import Foundation

class SessionManager{
    func getSigninState()-> Bool{
        return UserDefaults.standard.bool(forKey: "LOGED_IN")
        //return UserDefaults.standard.bool(forKey: "LOGED_IN")
    }
    func saveUserLogin(user: User){
        UserDefaults.standard.setValue(true, forKey: "LOGED_IN")
        UserDefaults.standard.setValue(user.userName, forKey: "USER_NAME")
        UserDefaults.standard.setValue(user.userEmail, forKey: "USER_EMAIL")
        UserDefaults.standard.setValue(user.userPhone, forKey: "USER_PHONE")
    }
    
    func getUserInfo() -> User {
        let user = User(
            userName: UserDefaults.standard.string(forKey: "USER_NAME") ?? "",
            userEmail: UserDefaults.standard.string(forKey: "USER_EMAIL") ?? "",
            userPassword: "",
            userPhone: UserDefaults.standard.string(forKey: "USER_PHONE") ?? "")
        return user
    }
    
    func clearLoginState(){
        UserDefaults.standard.setValue(false, forKey: "LOGED_IN")
    }
}
