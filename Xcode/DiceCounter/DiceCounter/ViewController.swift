//
//  ViewController.swift
//  DiceCounter
//
//  Created by Imam MohammadUvesh on 02/12/21.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var labelSum: UILabel!
    
    @IBOutlet weak var dice1: UIImageView!
    
    @IBOutlet weak var dice2: UIImageView!
    
    //MARK: Varibles
     var diceArray = ["dice1","dice2","dice3","dice4","dice5","dice7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func TapButtonTapped(_ sender: UIButton) {
        
        let value1 = Int.random(in: 0...5)
        print("value1",value1)
        let value2 = Int.random(in: 0...5)
        print("value2",value2)
        
        labelSum.text = "The Sum of Dice is \(value1 + value2 + 2 )"
        dice1.image = UIImage(named: diceArray[value1])
        dice2.image = UIImage(named: diceArray[value2])
    
    }
}

