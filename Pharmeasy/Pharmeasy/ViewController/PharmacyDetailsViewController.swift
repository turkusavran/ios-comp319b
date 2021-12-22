//
//  PharmacyDetailsViewController.swift
//  Pharmeasy
//
//  Created by Türkü on 19.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import UIKit

extension PharmacyDetailsViewController: PharmacyDetailDataSourceDelegate {
    func pharmacyDetailLoaded(pharmacyDetail: PharmacyDetail) {
        self.pharmacyDetailNameLabel.text = pharmacyDetail.Name
        self.pharmacyDetailAddresLabel.text = "Adress: \(pharmacyDetail.Address)"
        self.pharmacyDetailPhoneLabel.text = "Phone number: \(pharmacyDetail.Phone)"
    }
}

class PharmacyDetailsViewController: UIViewController {
    let pharmacyDetailDataSource = PharmacyDetailDataSource()
    
    @IBOutlet weak var pharmacyDetailNameLabel: UILabel!
    @IBOutlet weak var pharmacyDetailAddresLabel: UILabel!
    @IBOutlet weak var pharmacyDetailPhoneLabel: UILabel!
    
    var selectedPharmacyId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pharmacy Details"
        
        pharmacyDetailDataSource.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let pharmacyId = selectedPharmacyId {
            pharmacyDetailDataSource.loadPharmacyDetails(pharmacyId: pharmacyId)
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
