//
//  VegetablesViewController.swift
//  Fruitables
//
//  Created by Türkü on 6.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import UIKit

extension VegetablesViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vegetableDataSource.vegetableArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "vegetableCell", for: indexPath) as! VegetablesCollectionViewCell
        let vegetable = vegetableDataSource.vegetableArray[indexPath.row]
        
        item.vegetableImageView.image = UIImage(named: vegetable.imageName)
        item.nameLabel.text = vegetable.name

        return item
    }
    
    
    
}

class VegetablesViewController: UIViewController {
    let vegetableDataSource = VegetableDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()

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
