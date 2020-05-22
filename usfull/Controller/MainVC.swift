//
//  ViewController.swift
//  usfull
//
//  Created by Azar Aliyev on 15/05/2020.
//  Copyright © 2020 Azar Aliyev. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var mentorImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    var appData = AppData()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func topButtonPressed(_ sender: UIButton) {
        appData.buttonChoice = "top"
        
    // Adding to imageview buttonlike animation
        mentorImage.alpha = 0.8
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.mentorImage.alpha = 1
        }
        performSegue(withIdentifier: "toLoginVC", sender: self)
    }
    
    @IBAction func bottomButtonPressed(_ sender: UIButton) {
        appData.buttonChoice = "bottom"
        
    // Adding to imageview buttonlike animation
        userImage.alpha = 0.8
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.userImage.alpha = 1
        }
        performSegue(withIdentifier: "toLoginVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let loginVC = segue.destination as? LoginVC {
            loginVC.appData = appData
        }
    }
}

