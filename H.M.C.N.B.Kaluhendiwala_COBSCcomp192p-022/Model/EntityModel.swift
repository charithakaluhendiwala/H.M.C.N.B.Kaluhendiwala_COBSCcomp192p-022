//
//  EntityModel.swift
//  H.M.C.N.B.Kaluhendiwala_COBSCcomp192p-022
//
//  Created by char1 on 4/25/21.
//  Copyright © 2021 char1. All rights reserved.
//

import Foundation

struct User {
    var userName: String
    var userEmail: String
    var userPassword: String
    var userPhone: String
}

struct FoodItem {
    var _id: String
    var img: String
    var foodName: String
    var foodDescription: String
    var foodPrice: Double
//    var discount: Int
    var category:String
}
