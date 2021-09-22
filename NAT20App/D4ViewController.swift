//
//  D4ViewController.swift
//  NAT20App
//
//  Created by Gabby Gonzalez on 9/21/21.
//

import UIKit

class D4ViewController: UIViewController {
    

    @IBOutlet weak var d4Image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("I am in d4 view!")
        // Do any additional setup after loading the view.
        //d4Image.addGestureRecognizer(tapGesture)
    }

    @IBAction func D4Roll(_ sender: Any) {
        let rolledNumber = Int.random(in: 1...4)
        d4Image.image = UIImage(named: "d4-\(rolledNumber)")

        UIView.transition(with: d4Image, duration: 0.5, options: .transitionCurlDown, animations: nil, completion: nil)
    }
    
    
}
