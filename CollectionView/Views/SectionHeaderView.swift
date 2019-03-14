//
//  SectionHeaderView.swift
//  CollectionView
//
//  Created by mac on 3/14/19.
//  Copyright © 2019 TechnoSales. All rights reserved.
//

import UIKit

class SectionHeaderView : UICollectionReusableView
{
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    var photoCategory: PhotoCategory! {
        didSet {
            categoryTitleLabel.text = photoCategory.title
            categoryImageView.image = UIImage(named: photoCategory.categoryImageName)
        }
    }
}
