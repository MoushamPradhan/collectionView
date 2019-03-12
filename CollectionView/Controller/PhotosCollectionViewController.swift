//
//  PhotosCollectionViewController.swift
//  CollectionView
//
//  Created by mac on 3/8/19.
//  Copyright © 2019 TechnoSales. All rights reserved.
//

import UIKit

class PhotosCollectionViewController : UICollectionViewController {
    var photoCategories: [PhotoCategory] = PhotosLibrary.fetchPhotos()
    
    struct StoryBoard {
        static let PhotoCell = "PhotoCell"
        
        static let leftAndRightPadding: CGFloat = 2.0
        static let numberOfItemsPerRow: CGFloat = 3.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let collectionViewWidth = collectionView?.frame.width
        let itemWidth = (collectionViewWidth! - StoryBoard.leftAndRightPadding) / StoryBoard.numberOfItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        
    }
    // Mark: -UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return photoCategories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  photoCategories[section].imageNames.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.PhotoCell, for: indexPath) as! PhotoCell
        let photoCategory = photoCategories[indexPath.section]
        let imageNames = photoCategory.imageNames
        let imageName = imageNames[indexPath.item]
        cell.imageName = imageName
        return cell
    }
}
