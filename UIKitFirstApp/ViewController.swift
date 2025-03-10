//
//  ViewController.swift
//  UIKitFirstApp
//
//  Created by Carlos Xavier Carvajal Villegas on 4/3/25.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var etiqueta: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeText(_ sender: UIButton) {
        etiqueta.text = "Hola, mundo!"
    }
    
    @IBSegueAction func segueToScreenTwo(_ coder: NSCoder) -> ViewController2? {
        let secondView = ViewController2(coder: coder)
        
        secondView?.injectedText = textField.text
        
        return secondView
    }
    
    @IBSegueAction func segueToScreenThree(_ coder: NSCoder) -> ViewController3? {
        let thirdView = ViewController3(coder: coder)
        
        thirdView?.injectedText = textField.text
        
        return thirdView
    }
}
