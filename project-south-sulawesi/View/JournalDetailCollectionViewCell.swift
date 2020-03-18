//
//  JournalDetailCollectionViewCell.swift
//  project-south-sulawesi
//
//  Created by Andimas Bagaswara on 18/03/20.
//  Copyright © 2020 Andimas Bagaswara. All rights reserved.
//

import UIKit

class JournalDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cardContentView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var totalPostLabel: UILabel!
    
    var journalContents = JournalPostContentModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardContentView.layer.cornerRadius = 16
        cardContentView.layer.masksToBounds = true
        cardContentView.layer.shadowColor = UIColor.black.cgColor
        cardContentView.layer.shadowOpacity = 0.2
        cardContentView.layer.shadowOffset = .init(width: 0, height: 4)
        cardContentView.layer.shadowRadius = 12
        
        let date = Date()
        let daySuffix = findDaySuffix(from: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE d'\(daySuffix)', yyyy"
        dateLabel.text = dateFormatter.string(from: date)
        
        totalPostLabel.text = "\(journalContents.contents.count)"
    }
    
    func findDaySuffix(from date: Date) -> String {
        let calendar = Calendar.current
        let dayOfMonth = calendar.component(.day, from: date)
        switch dayOfMonth {
        case 1, 21, 31: return "st"
        case 2, 22: return "nd"
        case 3, 23: return "rd"
        default: return "th"
        }
    }

}
