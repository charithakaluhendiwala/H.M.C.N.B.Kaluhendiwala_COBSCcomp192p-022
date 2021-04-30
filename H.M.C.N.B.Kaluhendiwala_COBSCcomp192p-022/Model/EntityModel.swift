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
    var foodItemID: String
    var foodName: String
    var foodDescription: String
    var foodPrice: Double
    var discount: Int
    var foodImgRes: String
    var foodCategory: String
    var isActive: Bool
}

///category
struct Category {
    var id: String
    var Name: String
}

//struct Items {
//    var id: String
//    var Name: String
//    var Description: String
//    var Price: Decimal
//    var Image: String
//    var CategoryId: Int
//    var Discount: Decimal
//}

struct Order {
    var orderID: String
    var cust_email: String
    var cust_name: String
    var date: Double
    var status_code: Int
    var orderItems: [OrderItem] = []
}

struct OrderItem {
    var item_name: String
    var price: Double
}
