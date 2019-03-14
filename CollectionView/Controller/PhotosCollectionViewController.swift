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
        static let sectionHeaderView = "SectionHeaderView"
        static let showDetailVC = "ShowImageDetail"
        
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
    
    //Section HeaderView
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StoryBoard.sectionHeaderView, for: indexPath) as! SectionHeaderView
        let category = photoCategories[indexPath.section]
        
        sectionHeaderView.photoCategory = category
        return sectionHeaderView
    }
    
    //MARK: -UICollectionViewDelegate
    
    var selectedImage: UIImage!
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = photoCategories[indexPath.section]
        selectedImage = UIImage(named: category.imageNames[indexPath.item])
        
        performSegue(withIdentifier: StoryBoard.showDetailVC, sender: nil)
    }
}
