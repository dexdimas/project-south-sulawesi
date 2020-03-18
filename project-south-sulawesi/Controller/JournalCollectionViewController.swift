//
//  JournalCollectionViewController.swift
//  project-south-sulawesi
//
//  Created by Andimas Bagaswara on 18/03/20.
//  Copyright © 2020 Andimas Bagaswara. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class JournalCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var journalContents = JournalContentModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UINib(nibName: GlobalConstants.journalDetailNibName.rawValue, bundle: nil), forCellWithReuseIdentifier: GlobalConstants.journalDetailReuseableCell.rawValue)

        self.collectionView!.register(UINib(nibName: GlobalConstants.journalCreateNibName.rawValue, bundle: nil), forCellWithReuseIdentifier: GlobalConstants.journalCreateReuseableCell.rawValue)
        
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return journalContents.contents.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configure the cell
        var cell: UICollectionViewCell
        
        if journalContents.contents[indexPath.row].type == "detail" {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: GlobalConstants.journalDetailReuseableCell.rawValue, for: indexPath) as! JournalDetailCollectionViewCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: GlobalConstants.journalCreateReuseableCell.rawValue, for: indexPath) as! JournalCreateCollectionViewCell
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if journalContents.contents[indexPath.row].type != "detail" {
            let journalStoryboard: UIStoryboard = UIStoryboard(name: "Journal", bundle: nil)
            let createViewController = journalStoryboard.instantiateViewController(identifier: "CreateViewController") as! CreateViewController
            self.present(createViewController, animated: true, completion: nil)
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension JournalCollectionViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var cardHeightByWidthRatio: CGFloat = 0.9
        
        if journalContents.contents[indexPath.row].type == "detail" {
            cardHeightByWidthRatio = 0.4
        }
        
        let cardHorizontalOffset: CGFloat = 20
        let width = collectionView.bounds.size.width - 2 * cardHorizontalOffset
        let height: CGFloat = width * cardHeightByWidthRatio

        return CGSize(width: width, height: height)
    }
}
