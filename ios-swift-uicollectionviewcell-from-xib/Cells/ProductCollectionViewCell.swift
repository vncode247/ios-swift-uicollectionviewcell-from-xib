//
//  ProductCollectionViewCell.swift
//  ios-swift-uicollectionviewcell-from-xib
//
//  Created by demo on 5/20/18.
//  Copyright © 2018 VNCode247. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
