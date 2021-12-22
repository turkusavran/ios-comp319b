//
//  InfoViewController.swift
//  Fruitables
//
//  Created by Türkü on 6.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var infoText: UITextView!
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true){
        }
    }
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        infoText.text = "Welcome to Fruitables! In this app we introduce you with uncommon fruits and vegetables. You can see their names, pictures and if you click on them you can see interesting informations about them!"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
