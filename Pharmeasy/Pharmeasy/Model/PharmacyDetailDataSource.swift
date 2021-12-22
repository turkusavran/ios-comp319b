//
//  PharmacyDetailDataSource.swift
//  Pharmeasy
//
//  Created by Türkü on 20.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import Foundation

protocol PharmacyDetailDataSourceDelegate {
    func pharmacyDetailLoaded(pharmacyDetail: PharmacyDetail)
}

class PharmacyDetailDataSource {
    var delegate: PharmacyDetailDataSourceDelegate?
    
    func loadPharmacyDetails(pharmacyId: String) {
        let session = URLSession.shared
        
        if let url = URL(string: "https://koc.api.staging.tarentum.io/pharmacy/\(pharmacyId)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                
                let decoder = JSONDecoder()
                let pharmacyDetail = try! decoder.decode(PharmacyDetail.self, from: data!)
                
                DispatchQueue.main.async {
                    self.delegate?.pharmacyDetailLoaded(pharmacyDetail: pharmacyDetail)
                }
            }
            
            dataTask.resume()
        }
    }
    
}
