//
//  LaunchViewController.swift
//  H.M.C.N.B.Kaluhendiwala_COBSCcomp192p-022
//
//  Created by char1 on 4/25/21.
//  Copyright © 2021 char1. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    
    let sessionM = SessionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if sessionM.getSigninState(){
            self.performSegue(withIdentifier: "Launch2Home", sender: nil)
        }else{
            self.performSegue(withIdentifier: "Launch2Signin", sender: nil)
        }
    }

}
