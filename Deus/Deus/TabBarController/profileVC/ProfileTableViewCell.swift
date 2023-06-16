//
//  ProfileTableViewCell.swift
//  Deus
//
//  Created by Novastrid on 16/06/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet weak var imgLabel: UIImageView!
    @IBOutlet weak var profileLables: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
