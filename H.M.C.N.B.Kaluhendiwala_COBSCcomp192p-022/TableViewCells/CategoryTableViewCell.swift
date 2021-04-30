//
//  CategoryTableViewCell.swift
//  H.M.C.N.B.Kaluhendiwala_COBSCcomp192p-022
//
//  Created by char1 on 4/30/21.
//  Copyright © 2021 char1. All rights reserved.
//

import UIKit

//protocol YourCellDelegate : class {
//func didpressdelete(_ tag: Int)}

class CategoryTableViewCell: UITableViewCell {
    
//        var cellDeligate: YourCellDelegate?
//    @IBOutlet weak var txtCatName: UILabel!
    @IBOutlet weak var lblCategoryName: UILabel!
    
    class var reuseIdentifier: String {
        return "CategoryInfoReusable"
    }
    
    class var nibName: String {
        return "CategoryTableViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configXIB(category: Category) {
        lblCategoryName.text = category.Name
    }
    

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
//    func setUpView(category: Category){
//        txtCatName.text = category.Name
//    }
}
