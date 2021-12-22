//
//  FruitsViewController.swift
//  Fruitables
//
//  Created by Türkü on 6.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import UIKit

extension FruitsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitsDataSource.fruitArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fruitCell", for: indexPath) as! FruitsTableViewCell
        
        let fruit = fruitsDataSource.fruitArray[indexPath.row]
        cell.fruitImageView.image = UIImage(named: fruit.imageName)
        cell.nameLabel.text = fruit.name
        
        return cell
    }
}
    
class FruitsViewController: UIViewController {
    let fruitsDataSource = FruitDataSource()
    
    @IBOutlet weak var detailsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! FruitsTableViewCell
        
        let indexPath = detailsTableView.indexPath(for: cell)
        
        if let indexPath = indexPath {
            let fruit = fruitsDataSource.fruitArray[indexPath.row]
            
            let destination = segue.destination as! DetailViewController
            
            destination.selectedFruit = fruit
        }
    }
    

}
