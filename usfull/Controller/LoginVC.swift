//
//  LoginVC.swift
//  usfull
//
//  Created by Azar Aliyev on 17/05/2020.
//  Copyright © 2020 Azar Aliyev. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var pleaseloginLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    var appData = AppData()
    override func viewDidLoad() {
        super.viewDidLoad()
        for family: String in UIFont.familyNames
        {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
//in default, login button is unabled, until both textfields have been filled
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
        
        pleaseloginLabel.font = UIFont(name: "SegoeUI", size: 25)
        
// customizing registerButton
        let attributedString = NSAttributedString(string: NSLocalizedString("  tap here to register", comment: ""), attributes:[
            NSAttributedString.Key.font : UIFont.init(name: "Symbol", size: 15),
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.underlineStyle:1.0
        ])
        registerButton.setAttributedTitle(attributedString, for: .normal)
        registerButton.titleLabel?.font = UIFont(name: "SegoeUI-Light", size: 16)
        
// customizing textfields
        usernameTextField.backgroundColor = .clear
        usernameTextField.borderStyle = .none
        usernameTextField.layer.cornerRadius = 22.0
        usernameTextField.layer.borderWidth = 1.0
        usernameTextField.layer.borderColor = UIColor.white.cgColor
        usernameTextField.attributedPlaceholder = NSAttributedString(string: " Username", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 19)!])
        usernameTextField.textColor = UIColor.white
        let paddingView1: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 19))
        usernameTextField.leftView = paddingView1
        usernameTextField.leftViewMode = .always
        usernameTextField.rightViewMode = .always
        usernameTextField.font = UIFont(name: "SegoeUI", size: 17)
        
        passwordTextField.backgroundColor = .clear
        passwordTextField.borderStyle = .none
        passwordTextField.layer.cornerRadius = 22.0
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.attributedPlaceholder = NSAttributedString(string: " Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 19)!])
        passwordTextField.textColor = UIColor.white
        let paddingView2: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        passwordTextField.leftView = paddingView2
        passwordTextField.leftViewMode = .always
        passwordTextField.font = UIFont(name: "SegoeUI", size: 17)
// customizing loginButton
        
        loginButton.backgroundColor = UIColor.white
        loginButton.layer.cornerRadius = 22.0
        loginButton.titleLabel?.font = UIFont(name: "SegoeUI", size: 22)
        
    }
    
    func updateButton(){
        if usernameTextField.text != "" && passwordTextField.text != ""{
            loginButton.alpha = 1.0
            loginButton.isEnabled = true
        }
    }
    
}

extension LoginVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
      updateButton()
    }
}
