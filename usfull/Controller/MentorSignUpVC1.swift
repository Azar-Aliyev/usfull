//
//  MentorSignUp1.swift
//  usfull
//
//  Created by Azar Aliyev on 20/05/2020.
//  Copyright © 2020 Azar Aliyev. All rights reserved.
//

import UIKit
import SearchTextField

class MentorSignUpVC1: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: CustomTF!
    @IBOutlet weak var surnameTextField: CustomTF!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var emailTextField: CustomTF!
    @IBOutlet weak var phoneTextField: CustomTF!
    @IBOutlet weak var countryTextField: SearchTextField!
    
    @IBOutlet weak var cityTextField: SearchTextField!
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var datePickerHeight: NSLayoutConstraint!

    var flag = false
    
// textfield delegate
    var this = UITextField()
    let Countries = getCountryList()
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.alpha = 1
        
    }
    
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
        flag = checkTextField(text: countryTextField.text ?? " ")
        validateButton(flag: flag)
        unvalidateButton(flag: flag)
        if textField.placeholder == countryTextField.placeholder{
            if let text = countryTextField.text{
                getCitiesOfCountry(country: text)
                cityTextField.filterStrings(cities)
                cities = []
            }
            
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let Countries = getCountryList()

        countryTextField.filterStrings(Countries.map({($0.countryName ?? " ")}))
        cityTextField.startVisible = true
        
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
            width = 230
            
            nameTextField.layer.cornerRadius = 17
            surnameTextField.layer.cornerRadius = 17
            emailTextField.layer.cornerRadius = 17
            phoneTextField.layer.cornerRadius = 17
            
            nameTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            nameTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            nameTextField.attributedPlaceholder = NSAttributedString(string: " First Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            surnameTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            surnameTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            surnameTextField.attributedPlaceholder = NSAttributedString(string: "  Last Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            emailTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            emailTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            emailTextField.attributedPlaceholder = NSAttributedString(string: " E-mail", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            phoneTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            phoneTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            phoneTextField.attributedPlaceholder = NSAttributedString(string: " Phone number", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            countryTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            countryTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            countryTextField.attributedPlaceholder = NSAttributedString(string: " Phone number", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            cityTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            cityTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            cityTextField.attributedPlaceholder = NSAttributedString(string: " Phone number", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            
            datePickerHeight.constant = 120
            //datePickerWidth.constant = 230
        }
        else if UIScreen.main.bounds.height == 736.0{
            stackView.spacing = 35.0
            height = 40
            width = 230
            
            nameTextField.layer.cornerRadius = 19
            surnameTextField.layer.cornerRadius = 19
            emailTextField.layer.cornerRadius = 19
            phoneTextField.layer.cornerRadius = 19
            
            nameTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            nameTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            nameTextField.attributedPlaceholder = NSAttributedString(string: " First Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            surnameTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            surnameTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            surnameTextField.attributedPlaceholder = NSAttributedString(string: "  Last Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            emailTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            emailTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            emailTextField.attributedPlaceholder = NSAttributedString(string: " E-mail", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            phoneTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            phoneTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            phoneTextField.attributedPlaceholder = NSAttributedString(string: " Phone number", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            countryTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            countryTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            countryTextField.attributedPlaceholder = NSAttributedString(string: " Phone number", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            cityTextField.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            cityTextField.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
            cityTextField.attributedPlaceholder = NSAttributedString(string: " Phone number", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
            
            datePickerHeight.constant = 120
        }
        else{
            stackView.spacing = 40.0
            height = 41
            width = 230
            
            nameTextField.setPlaceholder(placeholder: " First Name")
            surnameTextField.setPlaceholder(placeholder: "Last Name")
            emailTextField.setPlaceholder(placeholder: " E-mail")
            phoneTextField.setPlaceholder(placeholder: " Phone Number")
            
        }
    
//customizing UIDatePicker
        datePickerView.setValue(UIColor.white, forKey: "textColor")
        datePickerView.sendAction("setHighlightsToday:", to: nil, for: nil)
        
        
// customizing dateOfBirthLabel
        dateOfBirthLabel.textColor = UIColor.white
        dateOfBirthLabel.font = UIFont(name: "SegoeUI", size: 19)
        dateOfBirthLabel.alpha = 0.7
        
//customizing country and city textfields
        countryTextField.backgroundColor = .clear
        countryTextField.borderStyle = .none
        countryTextField.attributedPlaceholder = NSAttributedString(string: " Country", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 19)!])
        countryTextField.textColor = UIColor.white
        let paddingView1: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 19))
        countryTextField.leftView = paddingView1
        countryTextField.leftViewMode = .always
        countryTextField.font = UIFont(name: "SegoeUI", size: 17)
        countryTextField.alpha = 0.7
        let bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0.0, y: countryTextField.frame.height - 1, width: countryTextField.frame.width, height: 1.0)
        bottomLine1.backgroundColor = UIColor.white.cgColor
        countryTextField.borderStyle = UITextField.BorderStyle.none
        countryTextField.layer.addSublayer(bottomLine1)
        countryTextField.theme.font = UIFont(name: "SegoeUI", size: 15)!
        
        
        cityTextField.backgroundColor = .clear
        cityTextField.borderStyle = .none
        cityTextField.attributedPlaceholder = NSAttributedString(string: " City", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 19)!])
        cityTextField.textColor = UIColor.white
        let paddingView2: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 19))
        cityTextField.leftView = paddingView2
        cityTextField.leftViewMode = .always
        cityTextField.rightViewMode = .always
        cityTextField.font = UIFont(name: "SegoeUI", size: 17)
        cityTextField.alpha = 0.7
        let bottomLine2 = CALayer()
        bottomLine2.frame = CGRect(x: 0.0, y: cityTextField.frame.height - 1, width: cityTextField.frame.width, height: 1.0)
        bottomLine2.backgroundColor = UIColor.white.cgColor
        cityTextField.borderStyle = UITextField.BorderStyle.none
        cityTextField.layer.addSublayer(bottomLine2)
        cityTextField.theme.font = UIFont(name: "SegoeUI", size: 15)!
        
//customizing next button
        nextButton.backgroundColor = UIColor.white
        nextButton.layer.cornerRadius = 22.0
        nextButton.titleLabel?.font = UIFont(name: "SegoeUI", size: 22)
        
//keyboard shifting
        
        NotificationCenter.default.addObserver(self, selector: #selector(MentorSignUpVC1.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(MentorSignUpVC1.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        


        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "fromMentor1ToSignupMentor2", sender: self)
    }

    
    func validateButton(flag: Bool){
        if nameTextField.text != "" && surnameTextField.text != "" && emailTextField.text != "" && phoneTextField.text != "" && countryTextField.text != "" && cityTextField.text != "" && flag{
            nextButton.alpha = 1.0
            nextButton.isEnabled = true
        }
    }
    
    func unvalidateButton(flag: Bool){
        if nameTextField.text == "" || surnameTextField.text == "" || emailTextField.text == "" || phoneTextField.text == "" || countryTextField.text == "" || cityTextField.text == "" || !flag{
            nextButton.isEnabled = false
            nextButton.alpha = 0.5
        }
    }
    
    var cities = [String]()
    func getCitiesOfCountry(country: String) {
        
        if let path = Bundle.main.path(forResource: "country-region-data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [[String:Any]]{
                    for result in jsonResult{
                        if let countryName = result["countryName"] as? String {
                            if (countryName.lowercased() == country.lowercased()) {
                                if let regions = result["regions"] as? [[String:Any]] {
                                    for region in regions {
                                        if let cityName = region["name"] as? String {
                                            cities.append(cityName)
                                        }
                                    }
                                }
                                break;
                            }
                            
                        }
                    }
                }
            } catch {
                // handle error
            }
        }
        
        
    }
    
    func checkTextField(text: String) -> Bool {
        var result = false
        for country in Countries.map({($0.countryName ?? " ")}) {
            if country == text {
                result = true
            }
        }
        return result
    }
    
    
    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 && (phoneTextField.isFirstResponder || cityTextField.isFirstResponder || countryTextField.isFirstResponder){
                self.view.frame.origin.y = 0
            }
        }
    }
    
    
    
    @objc func keyboardWillShow(notification: Notification) { if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue { if self.view.frame.origin.y == 0 && (phoneTextField.isFirstResponder || cityTextField.isFirstResponder || countryTextField.isFirstResponder) { self.view.frame.origin.y -= keyboardSize.height } } }
}





