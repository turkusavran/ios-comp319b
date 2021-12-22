//
//  RegionDataSource.swift
//  Pharmeasy
//
//  Created by Türkü on 20.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import Foundation

protocol RegionDataSourceDelegate {
    func regionListLoaded(regionList: [Region])
}

class RegionDataSource {
    var delegate: RegionDataSourceDelegate?
    
    func loadListOfRegions(cityId: Int) {
        let session = URLSession.shared
        
        if let url = URL(string: "https://koc.api.staging.tarentum.io/city/\(cityId)/region") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
            let dataTask = session.dataTask(with: request) { (data, response, error) in
            
                let decoder = JSONDecoder()
                let regionList = try! decoder.decode([Region].self, from: data!)
            
                DispatchQueue.main.async {
                    self.delegate?.regionListLoaded(regionList: regionList)
                }
            }
        
            dataTask.resume()
        }
    }
}
