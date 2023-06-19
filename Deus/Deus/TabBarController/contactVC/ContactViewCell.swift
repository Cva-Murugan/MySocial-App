//
//  ContactViewCell.swift
//  Deus
//
//  Created by Novastrid on 16/06/23.
//

import UIKit

class ContactViewCell: UITableViewCell {
    
    
    @IBOutlet weak var contactIMG: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactBTN: UIButton!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contactBTN.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func contactBtnTap(_ sender: Any) {
        
    }
    
    
}
