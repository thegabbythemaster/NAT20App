//
//  ViewController.swift
//  NAT20App
//
//  Created by Gabby Gonzalez on 9/16/21.
//

import UIKit
import SideMenu

class ViewController: UIViewController, MenuControllerDelegate {
    
    @IBOutlet weak var diceImage: UIImageView!
    @IBOutlet weak var diceLabel: UILabel!
    
    private var sideMenu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let menu = MenuListController(with: ["D4", "D6", "D8","D10", "D%10", "D12", "D20"])
        menu.delegate = self
        
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        
        sideMenu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGeasture))
        diceImage.addGestureRecognizer(tapGesture)
    }
    @IBAction func didTapMenu (){
        present(sideMenu!, animated: true)
    }
    
    func didSelectMenuItem(named: String) {
        sideMenu?.dismiss(animated: true, completion: { [weak self] in
            if named == "D4" {
                self?.diceImage.image = UIImage(named: "d4-1")
            }
            else if named == "D6" {
                self?.diceImage.image = UIImage(named: "d6-1")
            }
            else if named == "D8" {
                self?.diceImage.image = UIImage(named: "d8-1")
            }
            else if named == "D10" {
                self?.diceImage.image = UIImage(named: "d10-1")
            }
            else if named == "D10%" {
                self?.diceImage.image = UIImage(named: "d10%-1")
            }
            else if named == "D12" {
                self?.diceImage.image = UIImage(named: "d12-1")
            }
            else if named == "D20" {
                self?.diceImage.image = UIImage(named: "d20-1")
            }
        })
    }
    
    @objc func tapGeasture(){
        let rolledNumber = Int.random(in: 1...6)
        diceImage.image = UIImage(named: "d6-\(rolledNumber)")

        UIView.transition(with: diceImage, duration: 0.5, options: .transitionCurlDown, animations: nil, completion: nil)
    }

}
