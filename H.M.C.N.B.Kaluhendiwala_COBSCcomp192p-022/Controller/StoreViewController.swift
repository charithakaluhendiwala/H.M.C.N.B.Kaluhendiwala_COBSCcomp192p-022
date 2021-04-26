//
//  StoreViewController.swift
//  H.M.C.N.B.Kaluhendiwala_COBSCcomp192p-022
//
//  Created by char1 on 4/25/21.
//  Copyright © 2021 char1. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var menuView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func switchViews(_ sender: UISegmentedControl) {
            switch sender.selectedSegmentIndex{
            case 0:
                previewView.isHidden = false
                categoryView.isHidden = true
                menuView.isHidden = true
        
            case 1:
                previewView.isHidden = true
                categoryView.isHidden = false
                menuView.isHidden = true
    
            case 2:
                previewView.isHidden = true
                categoryView.isHidden = true
                menuView.isHidden = false
    
            default:
                break
        
    }
    
    }
}
