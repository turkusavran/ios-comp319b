//
//  RegionsViewController.swift
//  Pharmeasy
//
//  Created by Türkü on 19.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import UIKit

extension RegionsViewController: RegionDataSourceDelegate {
    func regionListLoaded(regionList: [Region]) {
        self.regionArray = regionList
        self.regionsTableView.reloadData()
    }
}

extension RegionsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegionsCell", for: indexPath) as! RegionsTableViewCell
        let region = regionArray[indexPath.row]
        cell.regionNameLabel.text = region.Name
        
        return cell
    }
}

class RegionsViewController: UIViewController {
    let regionDataSource = RegionDataSource()
    var regionArray: [Region] = []
    var selectedCityId = 0
    var selectedCityName = ""

    @IBOutlet weak var regionsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Regions Of \(selectedCityName)"
        
        regionDataSource.delegate = self
        regionDataSource.loadListOfRegions(cityId: selectedCityId)

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! RegionsTableViewCell
        
        let indexPath = regionsTableView.indexPath(for: cell)
        
        if let indexPath = indexPath {
            let region = regionArray[indexPath.row]
            
            let destination = segue.destination as! PharmaciesViewController
            
            destination.selectedRegionId = region.Id
            destination.selectedRegionName = region.Name
        }
    }
}
