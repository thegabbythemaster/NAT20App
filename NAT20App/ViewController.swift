//
//  ViewController.swift
//  NAT20App
//
//  Created by Gabby Gonzalez on 9/16/21.
//

import UIKit
import SideMenu

class ViewController: UIViewController {

    @IBOutlet weak var diceImage: UIImageView!
    
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        menu = SideMenuNavigationController(rootViewController: UIViewController())
        
        let rolledNumber = Int.random(in: 1...6)
        diceImage.image = UIImage(named: "d6-\(rolledNumber)")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGeasture))
        
        diceImage.addGestureRecognizer(tapGesture)
    }
    @IBAction func didTapMenu (){
        present(menu!, animated: true)
    }
    
    @objc func tapGeasture(){
        let rolledNumber = Int.random(in: 1...6)
        diceImage.image = UIImage(named: "d6-\(rolledNumber)")
        
        UIView.transition(with: diceImage, duration: 0.5, options: .transitionCurlDown, animations: nil, completion: nil)
    }
    
}


