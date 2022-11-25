//
//  UsernameTextField.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/23/22.
//

import Foundation
import UIKit

class UsernameTextField: UITextField {
    
    var textPadding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    var imagePadding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    
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
    
        let iconView = UIImageView()
        
        iconView.image = UIImage(systemName: "person.crop.circle")
        
        leftView = iconView
        leftViewMode = .always
        
    }
}
