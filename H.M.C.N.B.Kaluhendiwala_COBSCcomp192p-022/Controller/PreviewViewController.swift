//
//  PreviewViewController.swift
//  H.M.C.N.B.Kaluhendiwala_COBSCcomp192p-022
//
//  Created by char1 on 4/26/21.
//  Copyright © 2021 char1. All rights reserved.
//

import UIKit
import Firebase

class PreviewViewController: UIViewController {
    
    @IBOutlet weak var tblFood: UITableView!
    
    var ref: DatabaseReference!
    
    var foodItems: [FoodItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblFood.register(UINib(nibName: "PreviewTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodCellReuseIdentifer")
        ref = Database.database().reference()
        getFoodItemInfo()
    }
}


extension PreviewViewController {
    func getFoodItemInfo() {
        ref.child("foodItems").observe(.value, with: {
            (snapshot) in
            if let info = snapshot.value {
                if let foodItems = info as? [String: Any] {
                    for item in foodItems {
                        if let foodInfo = item.value as? [String: Any]{
                            let singleFoodItem = FoodItem(_id: "",
                                                          img: foodInfo["image"] as! String,
                                                          foodName: foodInfo["name"] as! String,
                                                          foodDescription: foodInfo["description"] as! String,
                                                          foodPrice: foodInfo["price"] as! Double,
//                                                          discount: foodInfo["discount"] as! Int,
                                                          category: foodInfo["category"] as! String)
                            self.foodItems.append(singleFoodItem)
                        }
                    }
                    self.tblFood.reloadData()
                }
            }
        })
    }
}



extension PreviewViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFood.dequeueReusableCell(withIdentifier: "FoodCellReuseIdentifer", for: indexPath) as! PreviewTableViewCell
         cell.setupView(foodItem: foodItems[indexPath.row])
         return cell
    }
    
     
}
