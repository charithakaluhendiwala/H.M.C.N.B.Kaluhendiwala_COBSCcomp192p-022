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
        let name = txtFoodName.text ?? ""
        let description = txtFoodDescription.text ?? ""
        let txtPrice = txtFoodPrice.text ?? ""
        let txtDiscount = txtFoodDiscount.text ?? ""



        
        if !InputValidator.isValidName(name: name){
               Loaf("Enter a valid Food name", state: .error, sender: self).show()
               return
           }

           if !InputValidator.isValidName(name: description){
               Loaf("Enter a valid Food Description", state: .error, sender: self).show()
               return
           }
                   
        if !InputValidator.isValidPrice(No :txtPrice){
               Loaf("Enter a valid Food Price", state: .error, sender: self).show()
               return
           }
            
        if !InputValidator.isValidPrice(No: txtDiscount){
               Loaf("Enter a valid Food Discount", state: .error, sender: self).show()
               return
           }


    }
}


