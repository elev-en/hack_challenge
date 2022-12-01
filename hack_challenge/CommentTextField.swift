//
//  CommentTextField.swift
//  hack_challenge
//
//  Created by kaitlyn on 12/1/22.
//

import UIKit

class CommentTextField: UITextField {
    
    var textPadding = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
    
    
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
    
        //let iconView = UIImageView()
        
        //iconView.image = UIImage(systemName: "person.crop.circle")
        
        //leftView = iconView
        leftViewMode = .always
        
    }
}


