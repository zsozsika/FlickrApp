//
//  SignUpVC.swift
//  FlickrApp
//
//  Created by Kovács Zsóka on 2018. 05. 22..
//  Copyright © 2018. Kovács Zsóka. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var firstNameTxtField: UITextField!
    @IBOutlet weak var lastNameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var passwordAgainTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpBtnWasPressed(_ sender: Any) {
        if firstNameTxtField.text != "" && lastNameTxtField.text != "" && emailTxtField.text != "" {
            
        }
    }
    
    @IBAction func cancelBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
