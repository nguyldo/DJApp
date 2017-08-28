//
//  SignInViewController.swift
//  DJApp
//
//  Created by Nguyen Do on 8/26/17.
//  Copyright © 2017 Gametime. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
