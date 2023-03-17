//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView: UIImageView!
    
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        diceImageView.image = UIImage(imageLiteralResourceName: "DiceTwo")
        
        diceImageView2.image = UIImage(imageLiteralResourceName: "DiceThree")
        
    }
    
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        
        let diceNums: [String] = ["One", "Two", "Three", "Four", "Five", "Six"]
        
        let diceOne: Int = Int.random(in: 1...6)
        let diceTwo: Int = Int.random(in: 1...6)
        
        diceImageView.image = UIImage(imageLiteralResourceName: "Dice\(diceNums[diceOne-1])")
        
        diceImageView2.image = UIImage(imageLiteralResourceName: "Dice\(diceNums[diceTwo-1])")
        
    }
    
}

