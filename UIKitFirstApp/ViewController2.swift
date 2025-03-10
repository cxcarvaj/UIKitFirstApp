//
//  ViewController2.swift
//  UIKitFirstApp
//
//  Created by Carlos Xavier Carvajal Villegas on 4/3/25.
//

import UIKit

final class ViewController2: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    var injectedText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelText.text = (self.injectedText != nil && self.injectedText!.isEmpty) ? "Welcome!" : self.injectedText
    }
    

    @IBAction func exitScreen(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
