//
//  CitiesViewController.swift
//  Pharmeasy
//
//  Created by Türkü on 19.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import UIKit

extension CitiesViewController: CityDataSourceDelegate {
    func cityListLoaded(cityList: [City]) {
        self.cityArray = cityList
        self.citiesTableView.reloadData()
    }
}

extension CitiesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesCell", for: indexPath) as! CitiesTableViewCell
        let city = cityArray[indexPath.row]
        cell.cityNameLabel.text = city.Name
        
        return cell
    }
}

class CitiesViewController: UIViewController {
    let cityDataSource = CityDataSource()
    var cityArray: [City] = []
    
    @IBOutlet weak var citiesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PHARMEASY"
        
        cityDataSource.delegate = self
        cityDataSource.loadListOfCities()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! CitiesTableViewCell
        
        let indexPath = citiesTableView.indexPath(for: cell)
        
        if let indexPath = indexPath {
            let city = cityArray[indexPath.row]
            
            let destination = segue.destination as! RegionsViewController
            
            destination.selectedCityId = city.Id
            destination.selectedCityName = city.Name
        }
    }
}
