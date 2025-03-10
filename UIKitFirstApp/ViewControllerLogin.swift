//
//  ViewControllerLogin.swift
//  UIKitFirstApp
//
//  Created by Carlos Xavier Carvajal Villegas on 6/3/25.
//

import UIKit

final class ViewControllerLogin: UIViewController {

    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func validateLogin() {
        performSegue(withIdentifier: "ok-login", sender: nil)
    }
    
    @IBAction func doLogin(_ sender: UIButton) {
        if user.text == "admin" && password.text == "1234" {
            validateLogin();
            password.text = ""
        } else {
            let alert = UIAlertController(title: "Error", message: "Usuario y clave no son correctos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBSegueAction func goToUserView(_ coder: NSCoder) -> UserViewController? {
        let vc = UserViewController(coder: coder)
        vc?.username = user.text
        user.text = ""
        return vc
    }
    
}
