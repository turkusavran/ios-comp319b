//
//  TextSizeSettingViewController.swift
//  Chatter
//
//  Created by Türkü on 18.12.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import UIKit

class TextSizeSettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func textSizeButton(_ sender: UIButton) {
        let selectedTextSize = sender.tag
        UserDefaults.standard.set(selectedTextSize, forKey: "selectedTextSize")
    }
}
