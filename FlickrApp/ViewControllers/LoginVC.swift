//
//  LoginVC.swift
//  FlickrApp
//
//  Created by Kovács Zsóka on 2018. 05. 22..
//  Copyright © 2018. Kovács Zsóka. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var fbLoginBtn: UIStackView!
    @IBOutlet weak var googleLoginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnWasPressed(_ sender: Any) {
        if userTxtField.text != "" || passwordTxtField.text != "" {
        let alertController = UIAlertController(title: "Error", message:
            "Wrong username or password!", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "TO_TABBAR", sender: nil)
        }
    }
    
    @IBAction func fbLoginBtnWasPressed(_ sender: Any) {
        performSegue(withIdentifier: "TO_TABBAR", sender: nil)
    }
    
    @IBAction func googleLoginBtnWasPressed(_ sender: Any) {
        performSegue(withIdentifier: "TO_TABBAR", sender: nil)
    }
    
    

}
