//
//  ConfirmPasswordTextField.swift
//  Pods
//
//  Created by Elaine Tsai on 11/23/22.
//

import Foundation
import UIKit
import Lottie

class PasswordTextField: UITextField {
    
    var textPadding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    private func setup(){
        self.isSecureTextEntry = true
    
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.setImage(UIImage(systemName: "eye"), for: .selected)
        button.addTarget(self, action: #selector(showHidePassword(_:)), for: .touchUpInside)
        
        rightView = button
        rightViewMode = .always
        
    }
    
    @objc private func showHidePassword(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        self.isSecureTextEntry = !sender.isSelected
    }
}

