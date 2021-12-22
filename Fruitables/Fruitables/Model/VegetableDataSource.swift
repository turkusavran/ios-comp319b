//
//  VegetableDataSource.swift
//  Fruitables
//
//  Created by Türkü on 6.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import Foundation

class VegetableDataSource {
    var vegetableArray: [Vegetable] = []
    
    init() {
        vegetableArray.append(Vegetable(name: "Brusselberry Sprouts", imageName: "brusselberrySprouts"))
        vegetableArray.append(Vegetable(name: "Oca", imageName: "oca"))
        vegetableArray.append(Vegetable(name: "Romanesco", imageName: "romanesco"))
        vegetableArray.append(Vegetable(name: "Kohlrabi", imageName: "kohlrabi"))
        vegetableArray.append(Vegetable(name: "Celeriac", imageName: "celeriac"))
        vegetableArray.append(Vegetable(name: "Sunchoke", imageName: "sunchoke"))
        vegetableArray.append(Vegetable(name: "Manioc", imageName: "manioc"))
        vegetableArray.append(Vegetable(name: "Yard-long Beans", imageName: "yard-longBeans"))
        vegetableArray.append(Vegetable(name: "Nopales", imageName: "nopales"))
        vegetableArray.append(Vegetable(name: "Jicama", imageName: "jicama"))
    }
}
