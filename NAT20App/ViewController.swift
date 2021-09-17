//
//  ViewController.swift
//  NAT20App
//
//  Created by Gabby Gonzalez on 9/16/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var diceImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollButtonAction(_ sender: Any) {
        //generate random number between 1-6
        let rolledNumber = Int.random(in: 1...6)
        
        //show the image for the dice in imageview according to rolled number
        diceImage.image = UIImage(named: "d6-\(rolledNumber)")
        
        //roll animation
        UIView.transition(with: diceImage, duration: 0.5, options: .transitionCurlDown, animations: nil, completion: nil)
    }
    
}

