//
//  PreviewTableViewCell.swift
//  H.M.C.N.B.Kaluhendiwala_COBSCcomp192p-022
//
//  Created by char1 on 4/26/21.
//  Copyright © 2021 char1. All rights reserved.
//

import UIKit
import Kingfisher

class PreviewTableViewCell: UITableViewCell {

    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblFoodDescription: UILabel!
    @IBOutlet weak var lblFoodPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupView(foodItem :FoodItem){
        lblFoodName.text = foodItem.foodName
        lblFoodDescription.text = foodItem.foodDescription
        lblFoodPrice.text = "Rs.\(foodItem.foodPrice)"
        imgFood.kf.setImage(with: URL(string: foodItem.img))
        
//        if foodItem.discount > 0 {
//            lblDiscount.isHidden = false
//            lblDiscount.text = "\(foodItem.discount)%"
//        }else{
//            lblDiscount.isHidden = true
//            lblDiscount.text = ""
//        }
    }
}
