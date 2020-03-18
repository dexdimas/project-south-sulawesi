//
//  DiscoverDetailViewController.swift
//  project-south-sulawesi
//
//  Created by Andimas Bagaswara on 18/03/20.
//  Copyright © 2020 Andimas Bagaswara. All rights reserved.
//

import UIKit

class DiscoverDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var image = UIImage()
    var name = ""
    var detail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = image
        titleLabel.text = name
        detailLabel.text = detail
        
        imageView.layer.masksToBounds = true
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.2
        imageView.layer.shadowOffset = .init(width: 0, height: 4)
        imageView.layer.shadowRadius = 12
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
