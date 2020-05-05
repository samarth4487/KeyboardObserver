//
//  Keyboard.swift
//  KeyboardObserver
//
//  Created by Samarth Paboowal on 05/05/20.
//  Copyright © 2020 Samarth. All rights reserved.
//

import UIKit

protocol KeyboardObserving: class {
    func keyboardWillShow(withSize size: CGSize)
    func keyboardWillHide()
}

extension KeyboardObserving {
    
    func addKeyboardObservers() {
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { [weak self] (notification) in
            
            guard let userInfo = notification.userInfo, let keyboardSizeValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
                return
            }
            
            let keyboardSize = keyboardSizeValue.cgRectValue
            self?.keyboardWillShow(withSize: keyboardSize.size)
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { [weak self] (_) in
            self?.keyboardWillHide()
        }
    }
    
    func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
