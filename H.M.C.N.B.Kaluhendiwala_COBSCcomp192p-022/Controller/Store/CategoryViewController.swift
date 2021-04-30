//
//  CategoryViewController.swift
//  H.M.C.N.B.Kaluhendiwala_COBSCcomp192p-022
//
//  Created by char1 on 4/29/21.
//  Copyright © 2021 char1. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import Loaf

class CategoryViewController: UIViewController {
    
    let databaseReference = Database.database().reference()
    
    var categoryList: [Category] = []

    
    @IBOutlet weak var txtCategoryName: UITextField!
    @IBOutlet weak var tblCategory: UITableView!
    
    var ref: DatabaseReference!
    
//    var category: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblCategory.register(UINib(nibName: CategoryTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: CategoryTableViewCell.reuseIdentifier)
        refreshCategories()
        
//        tblCategory.delegate = self;
//        tblCategory.dataSource = self;
//
//        ref = Database.database().reference()
//        tblCategory.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryCellViewIdentifier")
//
//        CategoryData()
//        self.tblCategory.reloadData();
    }
    
    @IBAction func onAddCategoryPresses(_ sender: Any) {
            if let name = txtCategoryName.text {
                adddCategory(name: name)
            } else {
                Loaf("Enter a category name", state: .error, sender: self).show()
            }
    }
    
    
//    @IBAction func btnAdd(_ sender: Any) {
//        let Cat = Category(id: "", Name: txtName.text ?? "")
//        self.SaveCategory(category: Cat)
//    }
//
//    func SaveCategory(category: Category)
//    {
////        let OrderData = [
////            "Id" : category.id,
////            "Name" : category.Name]
//
//        let randomInt = Int.random(in: 1..<10000)
//        if self.txtName.text == "" {
//            Loaf("Please enter Category", state: .error, sender: self).show()
//            return
//        }
//        else
//        {
//            self.ref.child("Catagory").child("\(randomInt)").setValue(["Name": self.txtName.text!])
//            {
//                (error, ref) in
//
//                    if let err = error{
//                        print(err.localizedDescription)
//                        Loaf("Data save failed!", state: .error, sender: self).show()
//                        return
//                    }
//
//                    Loaf("Data save successfully!", state: .success, sender: self).show{
//                        type in
//                        self.dismiss(animated: true, completion: nil)
//                        self.txtName.text = "";
//                    }
//            }
//        }
//    }

}


extension CategoryViewController {
    func adddCategory(name: String) {
        databaseReference
            .child("categories")
            .childByAutoId()
            .child("name")
            .setValue(name) {
                error, ref in
                if let error = error {
                    Loaf(error.localizedDescription, state: .error, sender: self).show()
                } else {
                    Loaf("Category Created", state: .success, sender: self).show()
                    self.refreshCategories()
                }
            }
    }
    
    func refreshCategories() {
        self.categoryList.removeAll()
        databaseReference
            .child("categories")
            .observeSingleEvent(of: .value, with: {
                snapshot in
                if snapshot.hasChildren() {
                    guard let data = snapshot.value as? [String: Any] else {
                        return
                    }
                    
                    for category in data {
                        if let categoryInfo = category.value as? [String: String] {
                            self.categoryList.append(Category(id: category.key, Name: categoryInfo["name"]!))
                        }
                    }
                    
                    self.tblCategory.reloadData()
                }
            })
    }
    
    func removeCategory(category: Category) {
        databaseReference
            .child("categories")
            .child(category.id)
            .removeValue() {
                error, databaseReference in
                if error != nil {
                    Loaf("Could not remove category", state: .error, sender: self).show()
                } else {
                    Loaf("Category Removed", state: .success, sender: self).show()
                    self.refreshCategories()
                }
            }
    }
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblCategory.dequeueReusableCell(withIdentifier: CategoryTableViewCell.reuseIdentifier, for: indexPath) as! CategoryTableViewCell
        cell.selectionStyle = .none
        cell.configXIB(category: self.categoryList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.removeCategory(category: categoryList[indexPath.row])
            refreshCategories()
        }
    }
}

//extension CategoryViewController{
//    func CategoryData(){
//        ref.child("Catagory").observe(.value, with: {
//            (snapshot) in
//
//            if let data = snapshot.value {
//                if let CategoryItems = data as? [String: Any]{
//                    self.category.removeAll();
//                    for CategoryInfo in CategoryItems {
//                        if let catInfo = CategoryInfo.value as? [String: Any]{
//
//                            let singleCategorytem = Category(
//                                id: "",
//                                Name: catInfo["Name"] as! String)
//
//                            self.category.append(singleCategorytem)
//                        }
//                    }
//
//                    self.tblCategory.reloadData()
//                }
//            }
//        })
//    }
//
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//      return true
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if (editingStyle == .delete) {
//
//            let alert = UIAlertController(title: "Confirm", message: "Are you sure want to delete the category?", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
//                self.deleteCategory(id: self.category[indexPath.row].id)
//            }))
//
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//
//            present(alert, animated: true, completion: nil)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
//
//    func deleteCategory(id:String){
//            let ref = Database.database().reference()
//            ref.child("catagory").child("\(id)").removeValue();
//            self.tblCategory.reloadData()
//    }
//}
//
//extension CategoryViewController : UITableViewDelegate , UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return category.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tblCategory.dequeueReusableCell(withIdentifier: "CategoryCellViewIdentifier", for: indexPath) as! CategoryTableViewCell
//        cell.setUpView(category: category[indexPath.row])
//        return cell
//    }
//}
