//
//  UserViewController.swift
//  UIKitFirstApp
//
//  Created by Carlos Xavier Carvajal Villegas on 8/3/25.
//

import UIKit

class UserViewController: UIViewController {
    
    var username: String?

    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelText.text = "Hello, \(username ?? "")!"

    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
