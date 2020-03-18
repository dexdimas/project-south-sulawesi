//
//  JournalCreateCollectionViewCell.swift
//  project-south-sulawesi
//
//  Created by Andimas Bagaswara on 18/03/20.
//  Copyright © 2020 Andimas Bagaswara. All rights reserved.
//

import UIKit

class JournalCreateCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cardContentView: UIView!
    @IBOutlet weak var cardButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardContentView.layer.cornerRadius = 16
        cardContentView.layer.masksToBounds = true
        cardContentView.layer.shadowColor = UIColor.black.cgColor
        cardContentView.layer.shadowOpacity = 0.2
        cardContentView.layer.shadowOffset = .init(width: 0, height: 4)
        cardContentView.layer.shadowRadius = 12
        
        cardButton.layer.cornerRadius = 5
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
    }
}
