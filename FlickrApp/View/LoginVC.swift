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
    
    @IBAction func fbLoginBtnWasPressed(_ sender: Any) {
        present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
    
    

}
