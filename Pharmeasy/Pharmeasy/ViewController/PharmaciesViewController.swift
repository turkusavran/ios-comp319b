//
//  PharmaciesViewController.swift
//  Pharmeasy
//
//  Created by Türkü on 19.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import UIKit

extension PharmaciesViewController: PharmacyDataSourceDelegate {
    func pharmacyListLoaded(pharmacyList: [Pharmacy]) {
        self.pharmacyArray = pharmacyList
        self.pharmaciesTableView.reloadData()
    }
}

extension PharmaciesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PharmaciesCell", for: indexPath) as! PharmaciesTableViewCell
        let pharmacy = pharmacyArray[indexPath.row]
        cell.pharmacyNameLabel.text = pharmacy.Name
        
        return cell
    }
}

class PharmaciesViewController: UIViewController {
    let pharmacyDataSource = PharmacyDataSource()
    var pharmacyArray: [Pharmacy] = []
    var selectedRegionId = ""
    var selectedRegionName = ""

    @IBOutlet weak var pharmaciesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pharmacies In \(selectedRegionName)"
        
        pharmacyDataSource.delegate = self
        pharmacyDataSource.loadListOfPharmacies(regionId: selectedRegionId)
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! PharmaciesTableViewCell
        
        let indexPath = pharmaciesTableView.indexPath(for: cell)
        
        if let indexPath = indexPath {
            let pharmacy = pharmacyArray[indexPath.row]
            
            let destination = segue.destination as! PharmacyDetailsViewController
            
            destination.selectedPharmacyId = pharmacy.Id
        }
    }
}
