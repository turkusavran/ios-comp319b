//
//  CityDataSource.swift
//  Pharmeasy
//
//  Created by Türkü on 20.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import Foundation

protocol CityDataSourceDelegate {
    func cityListLoaded(cityList: [City])
}

class CityDataSource {
    var delegate: CityDataSourceDelegate?
    
    func loadListOfCities() {
        let session = URLSession.shared
        
        if let url = URL(string: "https://koc.api.staging.tarentum.io/city") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                let decoder = JSONDecoder()
                let cityList = try! decoder.decode([City].self, from: data!)
                
                DispatchQueue.main.async {
                    self.delegate?.cityListLoaded(cityList: cityList)
                }
            }
            
            dataTask.resume()
        }
    }
}
