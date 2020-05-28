//
//  MentorSignUpVC2.swift
//  usfull
//
//  Created by Azar Aliyev on 20/05/2020.
//  Copyright © 2020 Azar Aliyev. All rights reserved.
//

import UIKit

class MentorSignUpVC2: UIViewController {

    @IBOutlet weak var userLogoButton: UIButton!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var addMoreInfoLabel: UILabel!
    
    @IBOutlet weak var infoTextField: InfoTextField!
    @IBOutlet weak var infoTextView: UITextView!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var userLogoBtnTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var infoTextFieldHeight: NSLayoutConstraint!
    @IBOutlet weak var infoTextViewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        infoTextView.delegate = self
        
    //customizing userLogoButton
        userLogoButton.layer.cornerRadius = userLogoButton.bounds.size.width / 2.0
        userLogoButton.layer.masksToBounds = true
        
    //customizing addPhotoButton
        addPhotoButton.titleLabel?.font = UIFont(name: "SegoeUI", size: 20)
    
    //customizing addMoreInfoLabel
        addMoreInfoLabel.font = UIFont(name: "SegoeUI", size: 17)
    
    //customizing TextView
        infoTextView.backgroundColor = .clear
        infoTextView.font = UIFont(name: "SegoeUI", size: 17)
        infoTextView.textColor = UIColor(red: 0.12, green: 0.25, blue: 0.41, alpha: 1.00)
        
        self.infoTextView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        
    //customizing submitButton
        submitButton.layer.cornerRadius = submitButton.frame.height/2.0
        submitButton.titleLabel?.font = UIFont(name: "SegoeUI-Semibold", size: 23)
        submitButton.setTitleColor(UIColor(red: 0.12, green: 0.25, blue: 0.41, alpha: 1.00), for: .normal)
        submitButton.backgroundColor = UIColor.white
        
    // customozing for different iphone sizes
        if UIScreen.main.bounds.height == 667.0 {
            userLogoButton.heightAnchor.constraint(equalToConstant: CGFloat(110)).isActive = true
            userLogoButton.widthAnchor.constraint(equalToConstant: CGFloat(110)).isActive = true
            userLogoButton.layer.cornerRadius = 55
            userLogoBtnTopConstraint.constant = 50
            infoTextFieldHeight.constant = 260
            infoTextViewHeight.constant = 250
        }
    //keyboard shifting
        
        NotificationCenter.default.addObserver(self, selector: #selector(MentorSignUpVC1.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(MentorSignUpVC1.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }
    
    @objc func keyboardWillShow(notification: Notification) { if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue { if self.view.frame.origin.y == 0 { self.view.frame.origin.y -= keyboardSize.height-25 } }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    }
}

extension MentorSignUpVC2: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        infoTextField.placeholder = ""
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty || textView.text == "" {
            infoTextField.attributedPlaceholder = NSAttributedString(string: "For example about your job or study...", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.12, green: 0.25, blue: 0.41, alpha: 1.00), NSAttributedString.Key.font : UIFont(name: "SegoeUI", size: 17)!])
        }
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        infoTextView.endEditing(true)
    }
}
