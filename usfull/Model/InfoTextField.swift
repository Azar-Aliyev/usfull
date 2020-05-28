//
//  InfoTextField.swift
//  usfull
//
//  Created by Azar Aliyev on 23/05/2020.
//  Copyright © 2020 Azar Aliyev. All rights reserved.
//

import UIKit

class InfoTextField: UITextField {

    override func awakeFromNib() {
        backgroundColor = UIColor.white
        layer.cornerRadius = 30.0
        clipsToBounds = true
        alpha = 0.65
        attributedPlaceholder = NSAttributedString(string: "For example about your job or study...", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.12, green: 0.25, blue: 0.41, alpha: 1.00), NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
        textColor = UIColor(red: 0.12, green: 0.25, blue: 0.41, alpha: 1.00)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        leftView = paddingView
        rightView = paddingView
        leftViewMode = UITextField.ViewMode.always
        rightViewMode = UITextField.ViewMode.always
        
        
    }
    
}
