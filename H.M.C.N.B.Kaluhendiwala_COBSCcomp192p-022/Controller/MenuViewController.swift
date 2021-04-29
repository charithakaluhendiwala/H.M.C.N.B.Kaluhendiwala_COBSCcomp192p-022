import UIKit
import Firebase
import Loaf

class MenuViewController: UIViewController {
    @IBOutlet weak var txtFoodName: UITextField!
    @IBOutlet weak var txtFoodDescription: UITextField!
    @IBOutlet weak var txtFoodPrice: UITextField!
    @IBOutlet weak var txtFoodDiscount: UITextField!
    
    
    var ref: DatabaseReference!
    var foodItems: [FoodItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()


        }
    
    @IBAction func onAddBtnPressed(_ sender: Any) {
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
        
//        let foodItem = FoodItem(_id: ("Int.random(in: 0...100)"), img: <#T##String#>, foodName: <#T##String#>, foodDescription: <#T##String#>, foodPrice: <#T##Double#>, discount: <#T##Int#>, category: <#T##String#>)


    }
}
//
//extension MenuViewController{
//    func registerFood(foodItems:FoodItem){
//        Auth.auth().createUser(withEmail: foodItems.foodName, password: user.userPassword) {
//            authResult, error in
//
//            if let err = error{
//                print(err.localizedDescription)
//                let alert = UIAlertController(title: "Error", message: "User allready have an Account", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//                return
//            }
//
//
//
//            self.saveUserData(user: user)
//        }
//
//    }
//}


