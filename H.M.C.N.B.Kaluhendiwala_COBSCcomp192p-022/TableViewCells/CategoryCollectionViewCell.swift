//
//  CategoryCollectionViewCell.swift
//  H.M.C.N.B.Kaluhendiwala_COBSCcomp192p-022
//
//  Created by char1 on 4/30/21.
//  Copyright © 2021 char1. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblCategoryName: UILabel!
    
    class var reuseIdentifier: String {
        return "CategoryCollectionCellReusable"
    }
    
    class var nibName: String {
        return "CategoryCollectionViewCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func confixXIB(category: Category) {
        lblCategoryName.text = category.Name
    }
}
