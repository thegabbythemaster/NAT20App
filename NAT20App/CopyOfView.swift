//
//  ViewController.swift
//  NAT20App
//
//  Created by Gabby Gonzalez on 9/16/21.
//

import UIKit
import SideMenu

class CopyOfView: UIViewController, MenuControllerDelegate {
    
    let DiceOption: [String: Int] = [
            "d4": 4,
            "d6": 6,
            "d8": 8,
            "d10": 10,
            "d10%": 10,
            "d12": 12,
            "d20": 20
    ]
        
    
    @IBOutlet weak var diceLabel: UILabel!
    @IBOutlet weak var diceImage: UIImageView!
    
    private var sideMenu: SideMenuNavigationController?
    
    var selectedDice : String = "d6-1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let menu = MenuListController(with: SideMenuItem.allCases)
        menu.delegate = self
        
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        
        sideMenu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.RollDice))
        diceImage.addGestureRecognizer(tapGesture)
        
    }

    @IBAction func didTapMenu (){
        present(sideMenu!, animated: true)
    }
    
    func didSelectMenuItem(named: SideMenuItem) {
        
        sideMenu?.dismiss(animated: true, completion: { [weak self] in
            self?.title = named.rawValue
            self?.selectedDice = named.rawValue.lowercased()
            self?.diceImage.image = UIImage(named: self!.selectedDice + "-1")
            print("selected")
        })
    }
    
    @objc func RollDice(){
        let numberOfFaces = DiceOption[selectedDice]!
        print(numberOfFaces)
        print(DiceOption[selectedDice])
        let rolledNumber = Int.random(in: 1...numberOfFaces)
        print(rolledNumber)
        diceImage.image = UIImage(named: "d" + selectedDice + "-" + "\(rolledNumber)")

        UIView.transition(with: diceImage, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }

}
