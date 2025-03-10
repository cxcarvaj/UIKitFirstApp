//
//  ObjectsViewController.swift
//  UIKitFirstApp
//
//  Created by Carlos Xavier Carvajal Villegas on 8/3/25.
//

import UIKit
import UniformTypeIdentifiers

final class ObjectsViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var menuOptions: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var progressIndicator: UIProgressView!
    @IBOutlet weak var progressButton: UIButton!
    @IBOutlet weak var paginator: UIPageControl!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var colorWell: UIColorWell!
    
    var pasteButton: UIPasteControl!
    var timer: Timer?
    var timerOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let action1 = UIAction(title: "Option 1") { action in
            print("He pulsado la opción 1")
        }
        
        let action2 = UIAction(title: "Option 2") { action in
            print("He pulsado la opción 2")
        }
        
        let menuOpts = UIMenu(title: "Choose an option", children: [action1, action2])
        
        //        let button = UIButton(type: .system)
        //        button.setTitle("Options", for: .normal)
        //        button.showsMenuAsPrimaryAction = true
        //        button.menu = menuOpts
        //        view.addSubview(button)
        
        //        button.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //            // Como aqui quiero colocar al botón, siempre va el botón primero
        //            // Al elemento que le quiero colocar constrains, deberá ir primero
        //            button.topAnchor.constraint(equalTo: headerTitle.bottomAnchor, constant: 20),
        //            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        //        ])
        
        menuOptions.showsMenuAsPrimaryAction = true
        menuOptions.menu = menuOpts
        
        colorWell.addTarget(self,
                            action: #selector(colorWellChanged(_:)),
                            for: .valueChanged)
        
        let configuration = UIPasteControl.Configuration()
        configuration.cornerStyle = .capsule
        configuration.displayMode = .iconAndLabel
        
        
        pasteButton = UIPasteControl(configuration: configuration)
        pasteButton.target = textField
        //        pasteConfiguration
        view.addSubview(pasteButton)
        pasteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
            pasteButton.topAnchor.constraint(equalTo: stepperLabel.bottomAnchor, constant: 7),
            
            pasteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ]
        )
        
    }
    
    @IBAction func onValueChangeSegmentedControl(_ sender: UISegmentedControl) {
        print("Has seleccionado \(sender.selectedSegmentIndex)")
        
        paginator.currentPage = sender.selectedSegmentIndex
    }
    
    @IBAction func onChangeTextField(_ sender: UITextField) {
        print(sender.text ?? "")
    }
    
    @IBAction func onChangeValueSlider(_ sender: UISlider) {
        print("Slider value: \(sender.value)")
    }
    
    @IBAction func onChangeSwitch(_ sender: UISwitch) {
        print(sender.isOn ? "Encendido" : "Apagado")
        
        sender.isOn ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
    @IBAction func activateProgressIndicator(_ sender: UIButton) {
        //{timer in Task...}
        //Si usabamos timer teniamos un problema con la concurrencia, por lo que no podiamos usar el valor propagado por el clousere. Por lo que tuvimos que usar el de la clase.
        timer = Timer
            .scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                Task { @MainActor [self] in
                    progressIndicatorInteraction()
                }
            }
    }
    
    func progressIndicatorInteraction() {
        if !timerOn {
            timerOn.toggle()
            progressButton.isEnabled = false
        }
        
        if progressIndicator.progress >= 1 {
            timer?.invalidate()
            progressButton.isEnabled = true
            timerOn.toggle()
        }
        progressIndicator.progress += 0.05
    }
    
    @IBAction func onTapStepper(_ sender: UIStepper) {
        stepperLabel.text = "\(Int(sender.value))"
    }
    
    @objc func colorWellChanged(_ sender: UIColorWell) {
        let selectedColor = sender.selectedColor ?? UIColor.clear
        print("Color seleccionado: \(selectedColor)")
        progressButton.tintColor = selectedColor
    }
    
//    override func paste(itemProviders: [NSItemProvider]) {
//        guard let item = itemProviders.first else { return }
//        if item.hasItemConformingToTypeIdentifier(UTType.text.identifier) {
//            item.loadItem(forTypeIdentifier: UTType.text.identifier) {
//                str, error in
//                guard let str = str as? String else { return }
//                Task { @MainActor in
//                    self.textField.text = str
//                }
//            }
//        }
//    }
    
    deinit {
        Task { @MainActor [weak self] in
            guard let self = self else { return }
            self.colorWell.removeTarget(self,
                                        action: #selector(self.colorWellChanged(_:)),
                                        for: .valueChanged)
        }
    }
}
