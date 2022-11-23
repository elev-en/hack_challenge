//
//  PasswordTextField.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/23/22.
//

import Foundation
import UIKit

class PasswordTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        self.isSecureTextEntry = true
    }
    
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    
    button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
    button.setImage(UIImage(systemName: "eye"), for: .selected)
    button.addTarget(self, action: #selector(showHidePassword(_:)), for: .touchUpInside)
    
    @objc private func showHidePassword(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        self.isSecureTextEntry = !sender.isSelected
    }
}
