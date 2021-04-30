import UIKit
import Firebase
import Loaf
import DropDown
import FirebaseStorage

class MenuViewController: UIViewController {
    
    @IBOutlet weak var txtFoodName: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtDiscount: UITextField!
    @IBOutlet weak var txtCategory: UITextField!
    @IBOutlet weak var imgFood: UIImageView!
    
    let databaseReference = Database.database().reference()
    
    var categoryPicker = UIPickerView()
    var selectedCategoryIndex = 0
    var categoryList: [Category] = []
    
    var selectedImage: UIImage?
    var imagePicker: ImagePicker!
    
    
    
//    @IBOutlet weak var txtFoodName: UITextField!
//    @IBOutlet weak var txtFoodDescription: UITextField!
//    @IBOutlet weak var txtFoodPrice: UITextField!
//    @IBOutlet weak var txtFoodDiscount: UITextField!
    
    //////
//    private let storage = Storage.storage().reference()
//    var pickerData: [String] = [String]()
    //////
//    let dropDown = DropDown()
    
//    var ref: DatabaseReference!
//    var foodItems: [FoodItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        ref = Database.database().reference()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.onPickImageClicked))
        self.imgFood.isUserInteractionEnabled = true
        self.imgFood.addGestureRecognizer(gesture)
        self.refreshCategories()

        }
    
    
    
    @IBAction func onAddFoodPressed(_ sender: Any) {
//        let name = txtFoodName.text ?? ""
//        let description = txtFoodDescription.text ?? ""
//        let txtPrice = txtFoodPrice.text ?? ""
//        let txtDiscount = txtFoodDiscount.text ?? ""
//
//        if !InputValidator.isValidName(name: name){
//               Loaf("Enter a valid Food name", state: .error, sender: self).show()
//               return
//           }
//
//           if !InputValidator.isValidName(name: description){
//               Loaf("Enter a valid Food Description", state: .error, sender: self).show()
//               return
//           }
//
//        if !InputValidator.isValidPrice(No :txtPrice){
//               Loaf("Enter a valid Food Price", state: .error, sender: self).show()
//               return
//           }
//
//        if !InputValidator.isValidPrice(No: txtDiscount){
//               Loaf("Enter a valid Food Discount", state: .error, sender: self).show()
//               return
//           }
//
        let foodItem = FoodItem(
            foodItemID: "",
            foodName: txtFoodName.text ?? "",
            foodDescription: txtDescription.text ?? "",
            foodPrice: Double(txtPrice.text ?? "") ?? 0,
            discount: Int(txtDiscount.text ?? "") ?? 0,
            foodImgRes: "",
            foodCategory: categoryList[selectedCategoryIndex].Name,
            isActive: true)
        
        self.addFoodItem(foodItem: foodItem)

    }
    @objc func onPickImageClicked(_ sender: UIImageView){
        self.imagePicker.present(from: sender)
    }
    


}

extension MenuViewController {
    
    func addFoodItem(foodItem: FoodItem) {
        
        guard let image = self.selectedImage else {
            Loaf("Add an image", state: .error, sender: self).show()
            return
        }
        
        if let uploadData = image.jpegData(compressionQuality: 0.5) {
            
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpeg"
            
            Storage.storage().reference().child("foodItemImages").child(foodItem.foodName).putData(uploadData, metadata: metaData) {
                meta, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    Loaf(error.localizedDescription, state: .error, sender: self).show()
                    return
                }
                
                Storage.storage().reference().child("foodItemImages").child(foodItem.foodName).downloadURL(completion: {
                    (url,error) in
                    guard let downloadURL = url else {
                        if let error = error {
                            print(error.localizedDescription)
                            Loaf(error.localizedDescription, state: .error, sender: self).show()
                        }
                        return
                    }
                    
                    Loaf("Image uploaded", state: .success, sender: self).show()
                    
                    let data = [
                        "food_name" : foodItem.foodName,
                        "description" : foodItem.foodDescription,
                        "price" : foodItem.foodPrice,
                        "discount" : foodItem.discount,
                        "category" : foodItem.foodCategory,
                        "isActive" : foodItem.isActive,
                        "imgage" : downloadURL.absoluteString
                    ] as [String : Any]
                    
                    self.databaseReference
                        .child("foodItems")
                        .childByAutoId()
                        .setValue(data) {
                            error, ref in
                            if let error = error {
                                Loaf(error.localizedDescription, state: .error, sender: self).show()
                            } else {
                                Loaf("Food item added", state: .success, sender: self).show()
                            }
                        }
                    
                })
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
                        }//(Category(id: category.key, name: categoryInfo["name"]!))
                    }
                    self.setupCategoryPicker()
                }
            })
    }
}

extension MenuViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func setupCategoryPicker() {
        let pickerToolBar = UIToolbar()
        pickerToolBar.sizeToFit()
        
//        let doneAction = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(onValuePicked))
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(onPickerCancelled))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        pickerToolBar.setItems([space, cancelButton], animated: true)
        
        txtCategory.inputAccessoryView = pickerToolBar
        txtCategory.inputView = categoryPicker
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
    }
    
    @objc func onPickerCancelled() {
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryList[row].Name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtCategory.text = categoryList[row].Name
        selectedCategoryIndex = row
    }
}

extension MenuViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.imgFood.image = image
        self.selectedImage = image
    }
}

