//
//  ViewController.swift
//  поднятие клавиатуры
//
//  Created by Алмаз Рахматуллин on 21.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var constraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        textField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        activatyNotificationKeyboard()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapViewAction))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func editingChanged(_ textField: UITextField) {
        print(textField.text ?? "")
    }
    
    @objc private func tapViewAction() {
        view.endEditing(true)
    }

    override func presentKeyboard(isOn: Bool, height: CGFloat) {
        constraint.constant = isOn ? height : 30.0
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
        }
    }
}

