//
//  GuessGameHelper.swift
//  guessGame
//
//  Created by Türkü on 16.10.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import Foundation

protocol GuessGameHelperDelegate {
    func startOver()
    func setRemainingChances(chance: Int)
    func setImage(imageName: String)
    func hideImage(trueOrFalse: Bool)
}

class GuessGameHelper {
    var number: Int = 0
    var remainingChances = 3
    var delegate: GuessGameHelperDelegate?
    
    func generateRandomNumber() {
        number = Int.random(in: 1...10)
    }
    
    func checkTheGuess(guessField: String) -> Int {
        if let guess = Int(guessField) {
            print(number)
            if (number == guess) {
                remainingChances = 3
                self.delegate?.startOver()
                return 0
            } else if (guess > 10 || guess < 0) {
                return 3
            } else if (number > guess) {
                remainingChances -= 1
                self.delegate?.setRemainingChances(chance: remainingChances)
                self.delegate?.setImage(imageName: "Up")
                return 1
            } else if (number < guess) {
                remainingChances -= 1
                self.delegate?.setRemainingChances(chance: remainingChances)
                self.delegate?.setImage(imageName: "Down")
                return -1
            }
        }
        
        return 2
    }
    
    func getRemainingChances() -> Int {
        if (remainingChances == 0) {
            remainingChances = 3
            self.delegate?.startOver()
            return 0
        }
        
        return self.remainingChances
    }
    
    func getNumber() -> Int {
        return number
    }
}
