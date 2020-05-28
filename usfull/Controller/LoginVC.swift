//
//  LoginVC.swift
//  usfull
//
//  Created by Azar Aliyev on 17/05/2020.
//  Copyright © 2020 Azar Aliyev. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var pleaseloginLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: CustomTF!
    @IBOutlet weak var passwordTextField: CustomTF!
    @IBOutlet weak var orLoginWithLabel: UILabel!
    var appData = AppData()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// checking the screen size
        var offset = 0.0
        if UIScreen.main.bounds.height == 667.0 {
            offset = 30
        }
        else{
            offset = 110
        }
        
        logoImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(offset)).isActive = true
        
//protocol definition part
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
//in default, login button is unabled, until both textfields have been filled
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
        
        pleaseloginLabel.font = UIFont(name: "SegoeUI", size: 25)
        
        orLoginWithLabel.font = UIFont(name: "SegoeUI-Light", size: 16)
// customizing registerButton
        let attributedString = NSAttributedString(string: NSLocalizedString("  tap here to register", comment: ""), attributes:[
            NSAttributedString.Key.font : UIFont.init(name: "SegoeUI", size: 15),
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.underlineStyle:1.0
        ])
        registerButton.setAttributedTitle(attributedString, for: .normal)
        registerButton.titleLabel?.font = UIFont(name: "SegoeUI-Light", size: 16)
        
// customizing textfields
        emailTextField.setPlaceholder(placeholder: " E-mail")
        passwordTextField.setPlaceholder(placeholder: " Password")
// customizing loginButton
        
        loginButton.backgroundColor = UIColor.white
        loginButton.layer.cornerRadius = 22.0
        loginButton.titleLabel?.font = UIFont(name: "SegoeUI", size: 22)

        
    }

    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if appData.buttonChoice == "top" {
            performSegue(withIdentifier: "fromLoginToSignupMentor1", sender: self)
        }
        else { performSegue(withIdentifier: "fromLoginToSignupUser1", sender: self)
            
        }
    }
    
    func updateButton(){
        if emailTextField.text != "" && passwordTextField.text != ""{
            loginButton.alpha = 1.0
            loginButton.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //pass data to signup mentor
    }
    
}

extension LoginVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateButton()
        textField.alpha = 0.7
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.alpha = 1
    }
}


