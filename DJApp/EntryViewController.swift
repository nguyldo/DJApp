//
//  EntryViewController.swift
//  DJApp
//
//  Created by Michael Xue on 8/13/17.
//  Copyright © 2017 Gametime. All rights reserved.
//

import UIKit
import Firebase

class EntryViewController: UIViewController {
    
    var ref: DatabaseReference!
    private var keyGenerator: KeyGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseApp.configure()
        ref = Database.database().reference()
        keyGenerator = KeyGenerator()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didJoinRoom(_ sender: Any) {
        // let key = "A1B2C3"
        // need to make text field with key property
        // if this text matches the key stored in database, sign in anonymously, else throw error
        
    }
    
    @IBAction func didCreateRoom(_ sender: Any) {
        // generate key
        var key = keyGenerator.getKey()
        
        ref.child("registeredID").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            
            var flag = true
            
            while flag {
            
                if let _ = value?[key] {
                    key = self.keyGenerator.generateNewKey()
                    flag = true
                } else {
                    flag = false
                }
            
            }
            
            Auth.auth().signInAnonymously(completion: { (user, error) in
                if let u = user {
                    self.ref.child("registeredID/" + u.uid).setValue(key)
                }
            })
            
        }) { (error) in
            print(error.localizedDescription)
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
