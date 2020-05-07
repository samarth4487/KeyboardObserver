//
//  ViewController.swift
//  KeyboardObserver
//
//  Created by Samarth Paboowal on 05/05/20.
//  Copyright © 2020 Samarth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardObservers()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    deinit {
        removeKeyboardObservers()
    }
    
}

extension ViewController: KeyboardObserving {
    
    func keyboardWillShow(withSize size: CGSize) {
    }
    
    func keyboardWillHide() {
    }
}

