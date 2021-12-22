//
//  DetailViewController.swift
//  Fruitables
//
//  Created by Türkü on 6.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var fruitableImageView: UIImageView!
    @IBOutlet weak var fruitableLabel: UILabel!
    @IBOutlet weak var fruitableTextView: UITextView!
    
    var selectedFruit: Fruit?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let fruit = selectedFruit {
            fruitableImageView.image = UIImage(named: fruit.imageName)
            fruitableLabel.text = fruit.name
        }
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
