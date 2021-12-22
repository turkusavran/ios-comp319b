//
//  FruitDataSource.swift
//  Fruitables
//
//  Created by Türkü on 6.11.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import Foundation

class FruitDataSource {
    var fruitArray: [Fruit] = []
    
    init() {
        fruitArray.append(Fruit(name: "Kiwano", imageName: "kiwano"))
        fruitArray.append(Fruit(name: "Durian", imageName: "durian"))
        fruitArray.append(Fruit(name: "Jack Fruit", imageName: "jackfruit"))
        fruitArray.append(Fruit(name: "Dragon Fruit", imageName: "dragonfruit"))
        fruitArray.append(Fruit(name: "Cherimoya", imageName: "cherimoya"))
        fruitArray.append(Fruit(name: "Korean Melon", imageName: "koreanMelon"))
        fruitArray.append(Fruit(name: "Passion Fruit", imageName: "passionFruit"))
        fruitArray.append(Fruit(name: "Feijoa", imageName: "feijoa"))
        fruitArray.append(Fruit(name: "Tamarillo", imageName: "tamarillo"))
        fruitArray.append(Fruit(name: "Jujube", imageName: "jujube"))
    }
}
