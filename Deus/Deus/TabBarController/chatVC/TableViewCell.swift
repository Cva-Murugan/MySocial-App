//
//  TableViewCell.swift
//  Deus
//
//  Created by Novastrid on 16/06/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileIMG: UIImageView!
    @IBOutlet weak var lastMSG: UILabel!
    @IBOutlet weak var msgTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileIMG.layer.cornerRadius =  self.profileIMG.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    
}
