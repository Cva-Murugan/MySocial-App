//
//  CollectionViewCell.swift
//  Deus
//
//  Created by Novastrid on 16/06/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

}
