//
//  ViewController3.swift
//  UIKitFirstApp
//
//  Created by Carlos Xavier Carvajal Villegas on 4/3/25.
//

import UIKit

final class ViewController3: UIViewController {

    @IBOutlet weak var textoDetalle: UILabel!
    var injectedText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textoDetalle.text = injectedText
    }
    

}
