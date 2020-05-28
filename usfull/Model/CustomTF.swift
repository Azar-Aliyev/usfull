//
//  CustomTF.swift
//  usfull
//
//  Created by Azar Aliyev on 20/05/2020.
//  Copyright © 2020 Azar Aliyev. All rights reserved.
//

import UIKit

class CustomTF: UITextField {
    var pHolder: String?
    
    func setPlaceholder(placeholder: String){
        pHolder = placeholder
        self.attributedPlaceholder = NSAttributedString(string: pHolder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 19)!])
    }
    
    override func awakeFromNib() {
            self.backgroundColor = .clear
            self.borderStyle = .none
            self.layer.cornerRadius = self.frame.height/2.0
            self.layer.borderWidth = 1.0
            self.layer.borderColor = UIColor.white.cgColor
            self.textColor = UIColor.white
            let paddingView1: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 19))
            self.leftView = paddingView1
            self.leftViewMode = .always
            self.rightViewMode = .always
            self.font = UIFont(name: "SegoeUI", size: 17)
            self.alpha = 0.7
    
    }

}
