//
//  UserViewController.swift
//  Chatter
//
//  Created by Türkü on 18.12.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import UIKit
import Firebase

class UserViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            let alert = UIAlertController(title: "Invalid authentication", message: signOutError.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
