//
//  DiscoverCollectionViewCell.swift
//  project-south-sulawesi
//
//  Created by Andimas Bagaswara on 16/03/20.
//  Copyright © 2020 Andimas Bagaswara. All rights reserved.
//

import UIKit

class DiscoverCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var secondaryLabel: UILabel!
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var cardContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        cardContentView.backgroundColor = .clear
        cardContentView.layer.cornerRadius = 16
        cardContentView.layer.masksToBounds = true
        cardContentView.layer.shadowColor = UIColor.black.cgColor
        cardContentView.layer.shadowOpacity = 0.2
        cardContentView.layer.shadowOffset = .init(width: 0, height: 4)
        cardContentView.layer.shadowRadius = 12
    }

}
