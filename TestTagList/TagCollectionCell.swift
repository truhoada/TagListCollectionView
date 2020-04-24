//
//  TagCollectionCell.swift
//  TestTagList
//
//  Created by TrungHD-D1 on 4/16/20.
//  Copyright © 2020 TrungHD-D1. All rights reserved.
//

import UIKit

class TagCollectionCell: UICollectionViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var tagNameMaxWidthConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        self.lbTitle.textColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        self.layer.cornerRadius = 4
        self.tagNameMaxWidthConstraint.constant = UIScreen.main.bounds.width - 8 * 2 - 16 * 2
    }

}
