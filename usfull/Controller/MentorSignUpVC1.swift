//
//  MentorSignUp1.swift
//  usfull
//
//  Created by Azar Aliyev on 20/05/2020.
//  Copyright © 2020 Azar Aliyev. All rights reserved.
//

import UIKit

class MentorSignUpVC1: UIViewController {

    @IBOutlet weak var nameTextField: CustomTF!
    @IBOutlet weak var surnameTextField: CustomTF!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var emailTextField: CustomTF!
    @IBOutlet weak var phoneTextField: CustomTF!
    @IBOutlet weak var countryTextField: CustomTF!
    @IBOutlet weak var cityTextField: CustomTF!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var datePickerHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
// protocol declaration stuff
        nameTextField.delegate = self
        surnameTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        countryTextField.delegate = self
        cityTextField.delegate = self
 
//in default, next button is unabled, until all textfields have been filled
        nextButton.isEnabled = false
        nextButton.alpha = 0.5

//checking size of device
        var height:Double = 0
        var width:Double = 0
        if UIScreen.main.bounds.height == 667.0 {
            stackView.spacing = 30.0
            height = 35
            width = 200
            nameTextField.layer.cornerRadius = 17
            surnameTextField.layer.cornerRadius = 17
            emailTextField.layer.cornerRadius = 17
            phoneTextField.layer.cornerRadius = 17
            countryTextField.layer.cornerRadius = 17
            cityTextField.layer.cornerRadius = 17
            
            nameTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            nameTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            nameTextField.attributedPlaceholder = NSAttributedString(string: " First Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            surnameTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            surnameTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            surnameTextField.attributedPlaceholder = NSAttributedString(string: " Last Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            emailTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            emailTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            emailTextField.attributedPlaceholder = NSAttributedString(string: " E-mail", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            phoneTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            phoneTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            phoneTextField.attributedPlaceholder = NSAttributedString(string: " Phone number", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            countryTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            countryTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            countryTextField.attributedPlaceholder = NSAttributedString(string: " Country", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            cityTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            cityTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            cityTextField.attributedPlaceholder = NSAttributedString(string: " City", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            
            datePickerHeight.constant = 120
        }
        else{
            stackView.spacing = 40.0
            height = 41
            width = 230
            
            nameTextField.setPlaceholder(placeholder: " First Name")
            surnameTextField.setPlaceholder(placeholder: "Last Name")
            emailTextField.setPlaceholder(placeholder: " e-mail")
            phoneTextField.setPlaceholder(placeholder: " Phone Number")
            countryTextField.setPlaceholder(placeholder: " Country")
            cityTextField.setPlaceholder(placeholder: " City")
        }
    
//customizing UIDatePicker
        datePickerView.setValue(UIColor.white, forKey: "textColor")
        datePickerView.sendAction("setHighlightsToday:", to: nil, for: nil)
        
        
// customizing dateOfBirthLabel
        dateOfBirthLabel.textColor = UIColor.white
        dateOfBirthLabel.font = UIFont(name: "SegoeUI", size: 19)
        
//customizing textfields
        
        
//customizing next button
        nextButton.backgroundColor = UIColor.white
        nextButton.layer.cornerRadius = 22.0
        nextButton.titleLabel?.font = UIFont(name: "SegoeUI", size: 22)
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func updateButton(){
        if nameTextField.text != "" && surnameTextField.text != "" && emailTextField.text != "" && phoneTextField.text != "" && countryTextField.text != "" && cityTextField.text != ""{
            nextButton.alpha = 1.0
            nextButton.isEnabled = true
        }
    }
}

extension MentorSignUpVC1: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.endEditing(true)
        surnameTextField.endEditing(true)
        emailTextField.endEditing(true)
        phoneTextField.endEditing(true)
        countryTextField.endEditing(true)
        cityTextField.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.alpha = 0.7
        updateButton()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.alpha = 1
    }
}
