import UIKit

class SignOutViewController: UIViewController {
    
    let sessionM = SessionManager()
    
    
    @IBOutlet weak var txtUserName: UILabel!
    @IBOutlet weak var txtEmail: UILabel!
    @IBOutlet weak var txtPhone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = sessionM.getUserInfo()
        txtUserName.text = user.userName
        txtEmail.text = user.userPhone
        txtPhone.text = user.userPhone
    }
    

    @IBAction func onSignOutPressed(_ sender: Any) {
        sessionM.clearLoginState()
        //exit(0);
    }
}
