//
//  SettingsTableViewCell.swift
//  Deus
//
//  Created by Novastrid on 16/06/23.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    @IBAction func switchTap(_ sender: Any) {
        print("switch")
    }
    
    @IBAction func btntap(_ sender: Any) {
        print("btn tapped")
    }
}
