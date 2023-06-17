//
//  SettingsViewController.swift
//  Deus
//
//  Created by Novastrid on 16/06/23.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(SettingsTableViewCell.nib, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.allowsSelection = false
    }
    
}


extension SettingsViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:SettingsTableViewCell.identifier) as! SettingsTableViewCell
        
        if indexPath.row == 0 {
            cell.settingsLabel.text = "Allow Push Notifications"
        }else {
            cell.settingsLabel.text = "Enable Face/Touch ID"
        }
        
        
        return cell
    }
    
}
