//
//  ViewController.swift
//  DiceProgram
//
//  Created by Yogesh Patel on 02/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageOne: UIImageView!
    @IBOutlet weak var diceImageTwo: UIImageView!
    @IBOutlet weak var diceLabel: UILabel!
    
    var diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func rollButtonTapped(_ sender: UIButton) {
        let value1 = Int.random(in: 0...5)
        print("value1", value1)
        let value2 = Int.random(in: 0...5)
        print("value2", value2)

        diceLabel.text = "The sum of dice is \(value1 + value2 + 2)"
        diceImageOne.image = UIImage(named: diceArray[value1])
        diceImageTwo.image = UIImage(named: diceArray[value2])
    }
}

