//
//  DiscoverCollectionViewController.swift
//  project-south-sulawesi
//
//  Created by Andimas Bagaswara on 16/03/20.
//  Copyright © 2020 Andimas Bagaswara. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DiscoverCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var discoverContents = DiscoverContentModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UINib(nibName: "DiscoverCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DiscoverReuseableCell")

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
        return discoverContents.contents.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoverReuseableCell", for: indexPath) as! DiscoverCollectionViewCell
        
        // Configure the cell
        cell.imageView.image = discoverContents.contents[indexPath.row].image
        cell.primaryLabel.text = discoverContents.contents[indexPath.row].primary
        cell.secondaryLabel.text = discoverContents.contents[indexPath.row].secondary
        cell.detailLabel.text = discoverContents.contents[indexPath.row].detail
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let discoverStoryboard: UIStoryboard = UIStoryboard(name: "Discover", bundle: nil)
        let discoverDetailViewController = discoverStoryboard.instantiateViewController(identifier: "DiscoverDetailViewController") as! DiscoverDetailViewController
        
        discoverDetailViewController.image = discoverContents.contents[indexPath.row].image
        discoverDetailViewController.name = discoverContents.contents[indexPath.row].primary
        discoverDetailViewController.detail = discoverContents.contents[indexPath.row].detail
        
        self.present(discoverDetailViewController, animated: true, completion: nil)
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

extension DiscoverCollectionViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cardHorizontalOffset: CGFloat = 20
        let cardHeightByWidthRatio: CGFloat = 1.2
        let width = collectionView.bounds.size.width - 2 * cardHorizontalOffset
        let height: CGFloat = width * cardHeightByWidthRatio
        return CGSize(width: width, height: height)
    }
}
