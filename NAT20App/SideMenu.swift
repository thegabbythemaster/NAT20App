//
//  ViewController.swift
//  NAT20App
//
//  Created by Gabby Gonzalez on 9/16/21.
//
import Foundation
import UIKit

protocol MenuControllerDelegate {
    func didSelectMenuItem(named: SideMenuItem)
}

enum SideMenuItem: String, CaseIterable {
    case d4 = "D4"
    case d6 = "D6"
    case d8 = "D8"
    case d10 = "D10"
    case d10p = "D10%"
    case d12 = "D12"
    case d20 = "D20"
}

class MenuListController: UITableViewController {
    
    public var delegate: MenuControllerDelegate?
    
    private let menuItems: [SideMenuItem]
    
    init(with menuItems: [SideMenuItem]){
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let sideMenuBackgroundColor = UIColor(red: 122/255.0, green: 22/255.0, blue: 166/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = sideMenuBackgroundColor
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.backgroundColor = sideMenuBackgroundColor
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
    }
}

