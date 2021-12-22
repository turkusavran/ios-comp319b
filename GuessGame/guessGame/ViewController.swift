//
//  ViewController.swift
//  guessGame
//
//  Created by Türkü on 5.10.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import UIKit

extension ViewController: GuessGameHelperDelegate {
    func hideImage(trueOrFalse: Bool) {
        if (trueOrFalse) {
            upOrDown.isHidden = true
        } else {
            upOrDown.isHidden = false
        }
    }
    
    func setImage(imageName: String) {
        upOrDown.image = UIImage(named: "\(imageName)")
    }
    
    func startOver() {
        upOrDown.isHidden = false
        UIView.animate(withDuration: 1.1, delay: 0.3, options: [.repeat, .autoreverse], animations: { self.upOrDown.alpha = 0 })
        guessGameHelper.generateRandomNumber()
        upOrDown.image = UIImage(named: "questionMark")
        guessField.text = "Make a guess between 1 and 10."
        self.setRemainingChances(chance: 3)
    }
    
    func setRemainingChances(chance: Int) {
        remainingChancesField.text = "Remaining chances: \(chance)"
    }
}

class ViewController: UIViewController {
    let guessGameHelper = GuessGameHelper()
    
    @IBOutlet weak var upOrDown: UIImageView!
    @IBOutlet weak var guessField: UITextField!
    @IBOutlet weak var remainingChancesField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessGameHelper.delegate = self
        startOver()
    }
    
    @IBAction func makeGuess(_ sender: Any) {
        let num = guessGameHelper.checkTheGuess(guessField: guessField.text!)
        
        if (num == 0) {
            let alert = UIAlertController(title: "CONGRATULATIONS!", message: "You won! Do you want to start over?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: nil))
            
            present(alert, animated: true, completion: nil)
        } else if (num == 3) {
            let alert = UIAlertController(title: "Invalid range!", message: "Please enter a number between 0 and 10.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            
            present(alert, animated: true, completion: nil)
        } else if (num == 2) {
            let alert = UIAlertController(title: "Invalid input!", message: "Please enter a number.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            
            present(alert, animated: true, completion: nil)
        }
        
        let correctNum = guessGameHelper.getNumber()
        
        if (guessGameHelper.getRemainingChances() == 0) {
            let alert = UIAlertController(title: "GAME OVER!", message: "The number was \(correctNum). Do you want to start over?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: nil))
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func guessButton(_ sender: UIButton) {
        guessField.resignFirstResponder()
    }
}
