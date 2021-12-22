//
//  PharmacyDataSource.swift
//  Pharmeasy
//
//  Created by Türkü on 20.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import Foundation

protocol PharmacyDataSourceDelegate {
    func pharmacyListLoaded(pharmacyList: [Pharmacy])
}

class PharmacyDataSource {
    var delegate: PharmacyDataSourceDelegate?
    
    func loadListOfPharmacies(regionId: String){
        let session = URLSession.shared
        
        if let url = URL(string: "https://koc.api.staging.tarentum.io/region/\(regionId)/pharmacy") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
            let dataTask = session.dataTask(with: request) { (data, response, error) in
            
                let decoder = JSONDecoder()
                let pharmacyList = try! decoder.decode([Pharmacy].self, from: data!)
            
                DispatchQueue.main.async {
                    self.delegate?.pharmacyListLoaded(pharmacyList: pharmacyList)
                }
            }
        
            dataTask.resume()
        }
    }
}
