//
//  UIViewController-Ext.swift
//  поднятие клавиатуры
//
//  Created by Алмаз Рахматуллин on 21.09.2023.
//

import UIKit

extension UIViewController {
    
    
    func activatyNotificationKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let value = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect  else {
            print("error")
            return
        }
        
        let height = value.height
        presentKeyboard(isOn: true, height: height)
    }
    
    
    @objc private func keyboardWillHide(_ notification: NSNotification) {
        presentKeyboard(isOn: false, height: 30)
    }
    
    
    @objc func presentKeyboard(isOn: Bool, height: CGFloat) { }
}
