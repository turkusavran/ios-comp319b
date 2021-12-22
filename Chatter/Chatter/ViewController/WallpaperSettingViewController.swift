//
//  WallpaperSettingViewController.swift
//  Chatter
//
//  Created by Türkü on 18.12.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import UIKit

class WallpaperSettingViewController: UIViewController {
    
    @IBOutlet var buttonArray: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonArray.forEach { (button) in
            button.layer.cornerRadius = button.frame.height / 2
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func colorButtonPressed(_ sender: UIButton) {
        let selectedColor = sender.backgroundColor
        UserDefaults.standard.set(selectedColor, forKey: "chatBackgroundColor")
        UIView.animate(withDuration: 0.05, animations: {
            sender.backgroundColor = UIColor.white
        }) { (_) in
            UIView.animate(withDuration: 0.05) {
                sender.backgroundColor = selectedColor
            }
        }
    }
}
